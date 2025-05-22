protocol AuthenticationServiceProtocol {

    func sendConfirmationCode(to phoneNumber: PhoneNumber) async throws

    func confirm(by verificationCode: String) async throws -> ConfirmResult

    func register(user: UserRegistrationModel) async throws -> RegisterResult
    
    func login() async throws -> LoginResult
    
    func isAuthenticated() async -> Bool

}
