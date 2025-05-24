import UIKit

class MoreBuilder: MoreBuilderProtocol {
    
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
        let router = MoreRouter(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService)
        let interactor = MoreInteractor(authenticaionService: authenticationService)
        let presenter = MorePresenter(router: router, interactor: interactor)
        let view = MoreViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }
    
}
