import UIKit

class AuthorizationRouter: AuthorizationRouterProtocol {

    weak var viewController: UIViewController?
    
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
    
    func goToPhoneNumberModule() {
        let moduleController = PhoneNumberBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService
        ).build()
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
    func goToMainModule() {
        let moduleController = MainBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService).build()
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }

}
