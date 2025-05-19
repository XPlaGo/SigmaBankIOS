import UIKit

class AuthorizationBuilder: AuthorizationBuilderProtocol {

    func build(authenticationManager: AuthenticationManagerProtocol,
               authenticationService: AuthenticationServiceProtocol) -> UIViewController {
        
        let router = AuthorizationRouter(authenticationService: authenticationService)
        let interactor = AuthorizationInteractor(authenticationService: authenticationService)
        let presenter = AuthorizationPresenter(router: router, interactor: interactor)
        let view = AuthorizationViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
