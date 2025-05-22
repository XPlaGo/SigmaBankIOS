import UIKit

class ConfirmationCodeBuilder: ConfirmationCodeBuilderProtocol {
    
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, accountService: AccountServiceProtocol) {
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func build() -> UIViewController {
        let router = ConfirmationCodeRouter(accountService: accountService)
        let interactor = ConfirmationCodeInteractor(authenticationService: authenticationService)
        let presenter = ConfirmationCodePresenter(router: router, interactor: interactor)
        let view = ConfirmationCodeViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
