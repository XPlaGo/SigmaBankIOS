protocol MainViewProtocol: AnyObject {

    func show()

}

protocol MainPresenterProtocol: AnyObject {

    func viewDidLoad(view: MainViewProtocol)

    func presentCardsModule()

    func presentHistoryModule()

    func presentMoreModule()

    func presentTransfersModule()

}

protocol MainInteractorInputProtocol: AnyObject {

}

protocol MainInteractorOutputProtocol: AnyObject {

}

protocol MainRouterProtocol: AnyObject {

}
