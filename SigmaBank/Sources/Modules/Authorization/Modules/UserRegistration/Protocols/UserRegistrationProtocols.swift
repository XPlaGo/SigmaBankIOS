protocol UserRegistrationViewProtocol: AnyObject {

    func show(view: PhoneNumberRouterProtocol)

}

protocol UserRegistrationPresenterProtocol: AnyObject {

    func viewDidLoad()

    func presentMainModule()

}

protocol UserRegistrationInteractorInputProtocol: AnyObject {

    func registerUser(_ registerModel: UserRegistrationModel)

}

protocol UserRegistrationInteractorOutputProtocol: AnyObject {

    func registerUserSuccess()

    func registerUserFailure(error: Error)

}

protocol UserRegistrationRouterProtocol: AnyObject {

    func goToMainModule()

}
