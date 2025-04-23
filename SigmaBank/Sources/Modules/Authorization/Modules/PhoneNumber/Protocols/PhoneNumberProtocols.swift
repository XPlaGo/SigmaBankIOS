protocol PhoneNumberViewProtocol: AnyObject {

    func show()

}

protocol PhoneNumberPresenterProtocol: AnyObject {

    func viewDidLoad(view: PhoneNumberViewProtocol)

    func presentConfirmationCodeModule(for phoneNumber: PhoneNumber)

}

protocol PhoneNumberInteractorInputProtocol: AnyObject {

    func sendConfirmationCode(to phoneNumber: PhoneNumber)

}

protocol PhoneNumberInteractorOutputProtocol: AnyObject {

    func sendConfirmationCodeSuccess()

    func sendConfirmationCodeError(error: Error)

}

protocol PhoneNumberRouterProtocol: AnyObject {

    func goToPhoneNumberModule(with phoneNumber: PhoneNumber)

}
