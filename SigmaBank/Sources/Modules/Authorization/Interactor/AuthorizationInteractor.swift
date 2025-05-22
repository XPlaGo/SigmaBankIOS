import Foundation

class AuthorizationInteractor: @preconcurrency AuthorizationInteractorInputProtocol {

    weak var output: AuthorizationInteractorOutputProtocol?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }

    @MainActor
    func checkCurrentUserAuthentication() {
        Task { [weak self] in
            self?.output?.loadingAuthentication()
            if await self?.authenticationService.isAuthenticated() ?? false {
                self?.output?.userAuthenticationFound()
            } else {
                self?.output?.userAuthenticationNotFound()
            }
        }
    }

}
