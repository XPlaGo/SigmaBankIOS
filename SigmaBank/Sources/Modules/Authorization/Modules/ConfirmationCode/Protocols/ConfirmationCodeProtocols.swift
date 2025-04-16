protocol ConfirmationCodeViewProtocol: AnyObject {

    func show()

}

protocol ConfirmationCodePresenterProtocol: AnyObject {

    func viewDidLoad(view: ConfirmationCodeViewProtocol)

    func presentMainModule()

    func presentRegistrationModule()

}

protocol ConfirmationCodeInteractorInputProtocol: AnyObject {

    func sendConfirmationCode(_ code: String)
}

protocol ConfirmationCodeInteractorOutputProtocol: AnyObject {

    func longgedIn(to user: User)

    func registrationNeeded()

}

protocol ConfirmationCodeRouterProtocol: AnyObject {

    func goToMainModule()

    func goToUserRegistrationModule()

}
