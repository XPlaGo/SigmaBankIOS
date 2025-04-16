protocol ProfileViewProtocol: AnyObject {

    func show(user: User)

}

protocol ProfilePresenterProtocol: AnyObject {

    func viewDidLoad(view: ProfileViewProtocol)

}

protocol ProfileInteractorInputProtocol: AnyObject {

    func loadCurrentUser()

}

protocol ProfileInteractorOutputProtocol: AnyObject {

    func loadCurrentUserSuccess(user: User)

    func loadCurrentUserFaulure(error: Error)

}

protocol ProfileRouterProtocol: AnyObject {

}
