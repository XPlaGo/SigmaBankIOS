import UIKit

class AuthorizationRouter: AuthorizationRouterProtocol {

    weak var viewController: UIViewController?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }
    
    func goToPhoneNumberModule() {
        let moduleController = PhoneNumberBuilder().build(authenticationService: authenticationService)
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
    func goToMainModule() {
        
    }

}
