import UIKit

class PhoneNumberRouter: PhoneNumberRouterProtocol {

    weak var viewController: UIViewController?
    
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, accountService: AccountServiceProtocol) {
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func goToConfirmationCodeModule(with phoneNumber: PhoneNumber) {
        let moduleController = ConfirmationCodeBuilder(
            authenticationService: authenticationService,
            accountService: accountService,
        ).build()
        viewController?.navigationController?.pushViewController(moduleController, animated: true)
    }

}
