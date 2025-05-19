import UIKit

protocol ConfirmationCodeViewProtocol: AnyObject {

    func show()
    
    func setConfirmError(error: ConfirmError?)
    
    func setLoading(_ loading: Bool)

}

protocol ConfirmationCodePresenterProtocol: AnyObject {

    func viewDidLoad(view: ConfirmationCodeViewProtocol)

    func confirm(code: String)

}

protocol ConfirmationCodeInteractorInputProtocol: AnyObject {

    func confirm(code: String)

}

protocol ConfirmationCodeInteractorOutputProtocol: AnyObject {
    
    func confirmLoading()

    func confirmSuccess()
    
    func confirmRegistrationRequired()
    
    func confirmError(error: ConfirmError)

}

protocol ConfirmationCodeRouterProtocol: AnyObject {

    func goToMainModule()

    func goToUserRegistrationModule()

}

protocol ConfirmationCodeBuilderProtocol: AnyObject {

    func build(authenticationService: AuthenticationServiceProtocol) -> UIViewController

}
