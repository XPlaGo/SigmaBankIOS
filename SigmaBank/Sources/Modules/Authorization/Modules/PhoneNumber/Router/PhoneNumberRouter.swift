import UIKit

class PhoneNumberRouter: PhoneNumberRouterProtocol {

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

    func goToConfirmationCodeModule(with phoneNumber: PhoneNumber) {
        let moduleController = ConfirmationCodeBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService,
        ).build()
        viewController?.navigationController?.pushViewController(moduleController, animated: true)
    }

}
