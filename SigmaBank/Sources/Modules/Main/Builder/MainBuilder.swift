import UIKit

class MainBuilder: MainBuilderProtocol {
    
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
        let router = MainRouter(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService)
        let interactor = MainInteractor()
        let presenter = MainPresenter(router: router, interactor: interactor)
        let viewController = MainViewController(presenter: presenter)
        
        router.viewController = viewController
        interactor.output = presenter

        return viewController
    }
}
