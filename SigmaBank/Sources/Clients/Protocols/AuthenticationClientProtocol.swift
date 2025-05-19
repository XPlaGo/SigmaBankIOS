protocol AuthenticationClientProtocol {

    func sendConfirmationCode(to phoneNumber: String) async throws -> SendConfirmationCodeClientResult

    func confirm(code: String, token: String) async throws -> ConfirmClientResult?

    func register(userData: RegisterModel, token: String) async throws -> RegisterClientResult

    func login(token: String) async throws -> LoginClientResult
}
