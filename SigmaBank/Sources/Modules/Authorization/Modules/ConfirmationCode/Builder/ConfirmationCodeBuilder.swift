import UIKit

class ConfirmationCodeBuilder: ConfirmationCodeBuilderProtocol {

    func build(authenticationService: AuthenticationServiceProtocol) -> UIViewController {
        let router = ConfirmationCodeRouter()
        let interactor = ConfirmationCodeInteractor(authenticationService: authenticationService)
        let presenter = ConfirmationCodePresenter(router: router, interactor: interactor)
        let view = ConfirmationCodeViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
