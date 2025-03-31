class UserModel: Codable {
    
    let id: String
    
    let phoneNumber: String

    let firstName: String
    let lastName: String
    let age: Int

}

class SendVerificationCodeResult {

    let token: String
    
    init(token: String) {
        self.token = token
    }

}

class ConfirmVerificationCodeResult {

    let token: String

    let needRegistration: Bool
    
    init(token: String, needRegistration: Bool) {
        self.token = token
        self.needRegistration = needRegistration
    }

}

class RegisterModel {

    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }

}

class RegisterResult {

    let token: String
    
    init(token: String) {
        self.token = token
    }

}

class LoginResult {

    let token: String

    let user: UserModel
    
    init(token: String, user: UserModel) {
        self.token = token
        self.user = user
    }

}

protocol AuthenticationClientProtocol {
    
    func sendVerificationCode(to phoneNumber: String) async throws -> SendVerificationCodeResult
    
    func confirmVerificationCode(code: String, token: AuthenticationToken) async throws -> ConfirmVerificationCodeResult
    
    func register(for: RegisterModel, token: AuthenticationToken) async throws -> RegisterResult
    
    func login(token: AuthenticationToken) async throws -> LoginResult

}
