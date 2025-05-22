import UIKit

class AuthorizationBuilder: AuthorizationBuilderProtocol {
    
    private let authenticationManager: AuthenticationManagerProtocol
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol,
         authenticationService: AuthenticationServiceProtocol,
         accountService: AccountServiceProtocol) {
        self.authenticationManager = authenticationManager
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func build() -> UIViewController {
        
        let router = AuthorizationRouter(authenticationService: authenticationService, accountService: accountService)
        let interactor = AuthorizationInteractor(authenticationService: authenticationService)
        let presenter = AuthorizationPresenter(router: router, interactor: interactor)
        let view = AuthorizationViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
