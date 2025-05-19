public class AccountService: AccountServiceProtocol {
    
    private let client: AccountClientProtocol
    private let authenticationManager: AuthenticationManagerProtocol
    
    init(client: AccountClientProtocol, authenticationManager: AuthenticationManagerProtocol) {
        self.client = client
        self.authenticationManager = authenticationManager
    }
    
    func getAccounts() async throws -> [Account] {
        let context = await authenticationManager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .authorizedToken(let token):
            return try await client.getAccounts(token: token)
        default:
            throw AuthenticationError.invalidContext
        }
    }

    func getCardPrivateData(for cardId: CardId) async throws -> CardPrivateData {
        let context = await authenticationManager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .authorizedToken(let token):
            return try await client.getCardPrivateData(for: cardId.value, token: token)
        default:
            throw AuthenticationError.invalidContext
        }
    }
    
}
