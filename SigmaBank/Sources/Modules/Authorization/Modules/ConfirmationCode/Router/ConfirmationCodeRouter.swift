import UIKit

class ConfirmationCodeRouter: ConfirmationCodeRouterProtocol {

    weak var viewController: UIViewController?
    
    private let accountService: AccountServiceProtocol
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }

    func goToMainModule() {
        let moduleController = MainBuilder(accountService: accountService).build()
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
    func goToUserRegistrationModule() {
        let moduleController = UIViewController()
        moduleController.title = "Registration"
        moduleController.view.backgroundColor = .systemBackground
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }

}
