class AuthenticationService: AuthenticationServiceProtocol {
    
    private let manager: AuthenticationManagerProtocol
    
    init(manager: AuthenticationManagerProtocol) {
        self.manager = manager
    }

    func sendConfirmationCode(to phoneNumber: PhoneNumber) async throws {
        let context = AuthenticationContext(token: .confirmationToken("token"))
        await self.manager.setCurrentContext(context)
    }

    func confirm(by verificationCode: String) async throws -> ConfirmResult {
        let context = await  self.manager.getCurrentContext()
        
        if context == nil {
            throw AuthenticationError.invalidContext
        }
        
        switch context?.token {
        case .confirmationToken(_):
            if verificationCode.hasSuffix("000") {
                return ConfirmResult.failed(error: .invalidConfirmationCode)
            } else if verificationCode.hasSuffix("111") {
                let context = AuthenticationContext(token: .confirmedToken("token"))
                await self.manager.setCurrentContext(context)
                return ConfirmResult.registrationRequeired
            } else {
                let context = AuthenticationContext(
                    token: .authorizedToken("token"),
                    user: User(
                        id: UserId(value: "user_id"),
                        phoneNumber: PhoneNumber(value: "+78000000000"),
                        firstName: "First",
                        lastName: "Last",
                        age: 20,
                    ))
                await self.manager.setCurrentContext(context)
                return ConfirmResult.success
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
        case .confirmedToken(_):
            return RegisterResult.success
        default:
            throw AuthenticationError.invalidContext
        }
    }

    func isAuthenticated() async -> Bool {
        let context = await self.manager.getCurrentContext()
        
        switch context?.token {
        case .authorizedToken(_):
            return context?.user != nil
        default:
            return false
        }
    }

}
