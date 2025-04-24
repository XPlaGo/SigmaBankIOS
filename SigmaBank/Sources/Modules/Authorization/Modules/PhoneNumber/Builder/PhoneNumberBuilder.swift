import UIKit

class PhoneNumberBuilder: PhoneNumberBuilderProtocol {

    func build(authenticationService: AuthenticationServiceProtocol) -> UIViewController {
        let router = PhoneNumberRouter(authenticationService: authenticationService)
        let interactor = PhoneNumberInteractor(authenticationService: authenticationService)
        let presenter = PhoneNumberPresenter(router: router, interactor: interactor)
        let view = PhoneNumberViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
