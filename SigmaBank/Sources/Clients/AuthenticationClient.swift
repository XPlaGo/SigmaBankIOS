import Foundation
import GRPCCore
import SwiftProtobuf
import GRPCNIOTransportHTTP2

class AuthenticationClient: AuthenticationClientProtocol {
    
    private var config: GrpcClientConfig
    
    init(config: GrpcClientConfig) {
        self.config = config
    }
    
    func sendConfirmationCode(to phoneNumber: String) async throws -> SendConfirmationCodeClientResult {
        let request = Xplago_SigmaBank_SendConfirmationCodeRequest.with({
            $0.phoneNumber = phoneNumber
        });
        
        return try await self.withClient { client in
            let response = try await client.sendConfirmationCode(request)
            return SendConfirmationCodeClientResult(token: response.token.value)
        }
    }
    
    func confirm(code: String, token: String) async throws -> ConfirmClientResult? {
        do {
            let metadata = makeMetadata(token: token)
            
            let request = Xplago_SigmaBank_ConfirmRequest.with {
                $0.code = code
            }
            
            return try await self.withClient { client in
                let response = try await client.confirm(request, metadata: metadata)
                return ConfirmClientResult(token: response.token.value, needRegistration: response.needRegistration)
            }
        } catch let error as RPCError {
            if error.code == RPCError.Code.invalidArgument {
                return nil
            }
            
            throw error
        }
    }
    
    func register(userData: RegisterModel, token: String) async throws -> RegisterClientResult {
        throw AuthenticationError.invalidContext
    }
    
    func login(token: String) async throws -> LoginClientResult {
        let metadata = makeMetadata(token: token)
        
        let request = Xplago_SigmaBank_LoginRequest()
        
        return try await self.withClient { client in
            let response = try await client.login(request, metadata: metadata)
            return LoginClientResult(token: response.token.value)
        }
    }
    
    private func withClient<Result: Sendable>(
        handler: (Xplago_SigmaBank_AuthService.Client<HTTP2ClientTransport.Posix>) async throws -> Result
    ) async throws -> Result {
        return try await withGRPCClient(
            transport: .http2NIOPosix(
                target: .dns(host: config.host, port: config.port),
                transportSecurity: .plaintext
            )
        ) { client in
            let client = Xplago_SigmaBank_AuthService.Client(wrapping: client)
            return try await handler(client)
        }
    }
    
    private func makeMetadata(token: String) -> Metadata {
        var metadata = Metadata()
        metadata.addString("Bearer \(token)", forKey: "Authorization")
        return metadata
    }
}
