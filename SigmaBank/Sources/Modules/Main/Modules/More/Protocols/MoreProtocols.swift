protocol MoreViewProtocol: AnyObject {

    func show()

}

protocol MorePresenterProtocol: AnyObject {

    func viewDidLoad(view: MorePresenterProtocol)

}

protocol MoreInteractorInputProtocol: AnyObject {

}

protocol MoreInteractorOutputProtocol: AnyObject {

}

protocol MoreRouterProtocol: AnyObject {

    func goToProfileModule()

}
