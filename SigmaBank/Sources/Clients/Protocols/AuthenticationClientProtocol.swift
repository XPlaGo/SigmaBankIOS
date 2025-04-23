protocol AuthenticationClientProtocol {

    func sendVerificationCode(to phoneNumber: String) async throws -> SendVerificationCodeResult

    func confirmVerificationCode(code: String, token: AuthenticationToken) async throws -> ConfirmVerificationCodeResult

    func register(for: RegisterModel, token: AuthenticationToken) async throws -> RegisterResult

    func login(token: AuthenticationToken) async throws -> LoginResult

}
