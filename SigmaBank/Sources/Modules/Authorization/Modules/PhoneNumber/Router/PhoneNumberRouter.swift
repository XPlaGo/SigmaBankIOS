import UIKit

class PhoneNumberRouter: PhoneNumberRouterProtocol {

    weak var viewController: UIViewController?
    
    private let authenticationService: AuthenticationServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol) {
        self.authenticationService = authenticationService
    }

    func goToConfirmationCodeModule(with phoneNumber: PhoneNumber) {
        let moduleController = ConfirmationCodeBuilder().build(authenticationService: authenticationService)
        viewController?.navigationController?.pushViewController(moduleController, animated: true)
    }

}
