import UIKit

protocol PhoneNumberViewProtocol: AnyObject {

    func show()

    func setValidationError(error: PhoneNumberValidationError?)

    func setLoading(_ loading: Bool)

}

protocol PhoneNumberPresenterProtocol: AnyObject {

    func viewDidLoad(view: PhoneNumberViewProtocol)

    func presentContinue(for phoneNumber: PhoneNumber)

}

protocol PhoneNumberInteractorInputProtocol: AnyObject {

    func check(phoneNumber: PhoneNumber)

    func sendConfirmationCode(to phoneNumber: PhoneNumber)

}

protocol PhoneNumberInteractorOutputProtocol: AnyObject {

    func checkSuccess(with phoneNumber: PhoneNumber)

    func checkError(error: PhoneNumberValidationError)

    func sendConfirmationCodeLoading()

    func sendConfirmationCodeSuccess(with phoneNumber: PhoneNumber)

    func sendConfirmationCodeError(error: PhoneNumberValidationError)

}

protocol PhoneNumberRouterProtocol: AnyObject {

    func goToConfirmationCodeModule(with phoneNumber: PhoneNumber)

}

protocol PhoneNumberBuilderProtocol: AnyObject {

    func build() -> UIViewController

}
