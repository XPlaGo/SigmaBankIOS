protocol CardViewProtocol: AnyObject {

    func show(card: Card, privateData: CardPrivateData)

}

protocol CardPresenterProtocol: AnyObject {

    func viewDidLoad(view: CardViewProtocol)

}

protocol CardInteractorInputProtocol: AnyObject {

    func loadPrivateData(for card: Card)

}

protocol CardInteractorOutputProtocol: AnyObject {

    func loadPrivateDataSuccess(provateData: CardPrivateData)

    func loadProvateDataFailure(error: Error)

}

protocol CardRouterProtocol: AnyObject {

}
