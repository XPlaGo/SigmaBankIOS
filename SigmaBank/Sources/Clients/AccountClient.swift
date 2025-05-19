import Foundation
import GRPCCore
import SwiftProtobuf
import GRPCNIOTransportHTTP2

public class AccountClient: AccountClientProtocol {
    
    private let config: GrpcClientConfig
    
    init(config: GrpcClientConfig) {
        self.config = config
    }

    func getAccounts(token: String) async throws -> [Account] {
        let metadata = makeMetadata(token: token)

        let request = Xplago_SigmaBank_GetAccountsRequest();
        
        return try await self.withClient { client in

            let response = try await client.getAccounts(request, metadata: metadata)
            
            return response.accounts.map { account in

                return Account(
                    id: AccountId(value: Int(account.id)),
                    cards: account.cards.map { card in
                        let type: CardType = switch card.type {
                            case .unknown: .unknown;
                            case .visa: .visa;
                            case .mastercard: .mastercard;
                            case .mir: .mir;
                            case .UNRECOGNIZED(_): .unknown;
                        }

                        return Card(
                            cardId: CardId(value: Int(card.id)),
                            cardNumber: CardNumber(value: card.number),
                            cardType: type,
                        )
                    },
                    amount: account.amount)
            }
        }
    }
    
    func getCardPrivateData(for cardId: Int, token: String) async throws -> CardPrivateData {
        let metadata = makeMetadata(token: token)

        let request = Xplago_SigmaBank_GetCardPrivateDataRequest.with({
            $0.cardID = Int64(cardId)
        });
        
        return try await self.withClient { client in

            let response = try await client.getCardPrivateData(request, metadata: metadata)
            
            return CardPrivateData(cardExpirationDate: response.expirationDate.date, cardCode: response.code)
        }
    }
    
    private func withClient<Result: Sendable>(
        handler: (Xplago_SigmaBank_AccountsService.Client<HTTP2ClientTransport.Posix>) async throws -> Result
    ) async throws -> Result {
        return try await withGRPCClient(
            transport: .http2NIOPosix(
                target: .dns(host: "localhost", port: 8082),
                transportSecurity: .plaintext
            )
        ) { client in
            let client = Xplago_SigmaBank_AccountsService.Client(wrapping: client)
            return try await handler(client)
        }
    }
    
    private func makeMetadata(token: String) -> Metadata {
        var metadata = Metadata()
        metadata.addString("Bearer \(token)", forKey: "Authorization")
        return metadata
    }

}
