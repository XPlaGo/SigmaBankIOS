import UIKit

class AuthorizationRouter: AuthorizationRouterProtocol {

    weak var viewController: UIViewController?
    
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, accountService: AccountServiceProtocol) {
        self.authenticationService = authenticationService
        self.accountService = accountService
    }
    
    func goToPhoneNumberModule() {
        let moduleController = PhoneNumberBuilder(
            authenticationService: authenticationService,
            accountService: accountService
        ).build()
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
    func goToMainModule() {
        let moduleController = MainBuilder(accountService: accountService).build()
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }

}
