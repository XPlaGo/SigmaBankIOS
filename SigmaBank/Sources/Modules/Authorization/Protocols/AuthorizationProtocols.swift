import UIKit

protocol AuthorizationViewProtocol: AnyObject {

    func show()

}

protocol AuthorizationPresenterProtocol: AnyObject {

    func viewDidLoad(view: AuthorizationViewProtocol)

}

protocol AuthorizationInteractorInputProtocol: AnyObject {

    func checkCurrentUserAuthentication()

}

protocol AuthorizationInteractorOutputProtocol: AnyObject {

    func userAuthenticationFound()

    func userAuthenticationNotFound()

}

protocol AuthorizationRouterProtocol: AnyObject {

    func goToPhoneNumberModule()

    func goToMainModule()

}

protocol AuthorizationBuilderProtocol: AnyObject {

    func build() -> UIViewController

}
