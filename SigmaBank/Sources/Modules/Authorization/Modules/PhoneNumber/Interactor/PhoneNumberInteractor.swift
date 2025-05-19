import Foundation

class PhoneNumberInteractor: @preconcurrency PhoneNumberInteractorInputProtocol {

    weak var output: PhoneNumberInteractorOutputProtocol?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }

    func check(phoneNumber: PhoneNumber) {
        if isValidPhone(phoneNumber) {
            self.output?.checkSuccess(with: phoneNumber)
        } else {
            self.output?.checkError(error: PhoneNumberValidationError(message: "Invalid phone number"))
        }
    }

    @MainActor
    func sendConfirmationCode(to phoneNumber: PhoneNumber) {
        Task { [weak self] in
            self?.output?.sendConfirmationCodeLoading()
            
            try await self?.authenticationService.sendConfirmationCode(to: phoneNumber)
            
            self?.output?.sendConfirmationCodeSuccess(with: phoneNumber)
        }
    }

    private func isValidPhone(_ phoneNumber: PhoneNumber) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber.value)
    }

}
