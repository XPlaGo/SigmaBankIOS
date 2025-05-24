import UIKit

class MoreRouter: MoreRouterProtocol {
    
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

    func goToProfileModule() {
        
    }
    
    func goToAuthModule() {
        let moduleController = AuthorizationBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService).build()
        viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
}
