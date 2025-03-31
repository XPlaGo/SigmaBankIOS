class UserRegistrationModel {

    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }

}

protocol AuthenticationServiceProtocol {

    func sendVerificationCode(to phoneNumber: PhoneNumber) async throws -> AuthenticationContext

    func confirmVerificartionCode(with verificationCode: String, context: AuthenticationContext) async throws -> AuthenticationContext

    func register(user: UserRegistrationModel, context: AuthenticationContext) async throws -> AuthenticationContext
    
    func login(context: AuthenticationContext) async throws -> AuthenticationContext

}
