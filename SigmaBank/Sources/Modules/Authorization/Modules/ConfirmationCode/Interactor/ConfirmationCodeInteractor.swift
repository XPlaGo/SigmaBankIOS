import Foundation

class ConfirmationCodeInteractor: @preconcurrency ConfirmationCodeInteractorInputProtocol {

    weak var output: ConfirmationCodeInteractorOutputProtocol?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }

    @MainActor
    func confirm(code: String) {
        Task { [weak self] in
            self?.output?.confirmLoading()
        
            let result = try await self?.authenticationService.confirm(by: code)
            
            switch result! {
            case .success:
                self?.output?.confirmSuccess()
            case .registrationRequeired:
                self?.output?.confirmRegistrationRequired()
            case .failed(error: let error):
                self?.output?.confirmError(error: error)
            }
        }
    }

}
