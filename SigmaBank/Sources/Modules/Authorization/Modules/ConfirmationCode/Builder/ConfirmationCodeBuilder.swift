import UIKit

class ConfirmationCodeBuilder: ConfirmationCodeBuilderProtocol {
    
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
        let router = ConfirmationCodeRouter(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService)
        let interactor = ConfirmationCodeInteractor(authenticationService: authenticationService)
        let presenter = ConfirmationCodePresenter(router: router, interactor: interactor)
        let view = ConfirmationCodeViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
