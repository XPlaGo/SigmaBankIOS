class AuthenticationService: AuthenticationServiceProtocol {
    
    private let client: AuthenticationClientProtocol
    private let manager: AuthenticationManagerProtocol
    
    init(client: AuthenticationClientProtocol, manager: AuthenticationManagerProtocol) {
        self.client = client
        self.manager = manager
    }

    func sendConfirmationCode(to phoneNumber: PhoneNumber) async throws {
        let result = try await client.sendConfirmationCode(to: phoneNumber.value)
        let context = AuthenticationContext(token: .confirmationToken(result.token))
        await manager.setCurrentContext(context)
    }

    func confirm(by code: String) async throws -> ConfirmResult {
        let context = await self.manager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .confirmationToken(let tokenValue):
            let result = try await client.confirm(code: code, token: tokenValue)
            
            switch result {
            case .none:
                return ConfirmResult.failed(error: ConfirmError.invalidConfirmationCode)
            case .some(let result):
                if (result.needRegistration) {
                    let context = AuthenticationContext(token: .confirmedToken(result.token))
                    await self.manager.setCurrentContext(context)
                    return ConfirmResult.registrationRequeired
                } else {
                    let context = AuthenticationContext(token: .confirmedToken(result.token))
                    await self.manager.setCurrentContext(context)
                    return ConfirmResult.success
                }
            }
        default:
            throw AuthenticationError.invalidContext
        }
    }

    func register(user: UserRegistrationModel) async throws -> RegisterResult {
        let context = await self.manager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .confirmedToken(let token):
            let result = try await self.client.register(
                userData: RegisterModel(firstName: user.firstName, lastName: user.lastName, age: user.age),
                token: token)

            let context = AuthenticationContext(token: .authorizedToken(result.token))
            await self.manager.setCurrentContext(context)

            return RegisterResult.success
        default:
            throw AuthenticationError.invalidContext
        }
    }
    
    func login() async throws -> LoginResult {
        let context = await self.manager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .confirmedToken(let token):
            let result = try await self.client.login(token: token)
            print(result.token)

            let context = AuthenticationContext(token: .authorizedToken(result.token))
            await self.manager.setCurrentContext(context)

            return LoginResult.success
        default:
            throw AuthenticationError.invalidContext
        }
    }

    func isAuthenticated() async -> Bool {
        let context = await self.manager.getCurrentContext()
        
        switch context?.token {
        case .authorizedToken(_):
            return true
        default:
            return false
        }
    }

}
