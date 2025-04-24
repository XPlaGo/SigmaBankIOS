import UIKit

class ConfirmationCodeRouter: ConfirmationCodeRouterProtocol {

    weak var viewController: UIViewController?

    func goToMainModule() {
        let moduleController = UIViewController()
        moduleController.title = "Main"
        moduleController.view.backgroundColor = .systemBackground
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }
    
    func goToUserRegistrationModule() {
        let moduleController = UIViewController()
        moduleController.title = "Registration"
        moduleController.view.backgroundColor = .systemBackground
        self.viewController?.navigationController?.setViewControllers([moduleController], animated: true)
    }

}
