protocol AuthorizationViewProtocol: AnyObject {

    func show()

}

protocol AuthorizationPresenterProtocol: AnyObject {

    func viewDidLoad(view: AuthorizationViewProtocol)

    func presentPhoneNumberModule()

    func presentMainModule()

}

protocol AuthorizationInteractorInputProtocol: AnyObject {

    func checkCurrentUserAuthentication()

}

protocol AuthorizationInteractorOutputProtocol: AnyObject {

    func userAuthenticationSuccess(_ user: User)

    func userAuthenticationFailed(error: Error)

}

protocol AuthorizationRouterProtocol: AnyObject {

    func goToPhoneNumberModule()

    func goToMainModule()

}
