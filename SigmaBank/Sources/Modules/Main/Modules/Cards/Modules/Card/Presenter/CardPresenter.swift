class CardPresenter: CardPresenterProtocol {

    private weak var view: CardViewProtocol?

    private let router: CardRouterProtocol

    private let interactor: CardInteractorInputProtocol

    init(router: CardRouterProtocol,
         interactor: CardInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: any CardViewProtocol, card: Card) {
        self.view = view
        self.view?.show(card: card)
    }
    
    func loadPrivateData(for card: Card) {
        self.interactor.loadPrivateData(for: card)
    }
    
}

extension CardPresenter: CardInteractorOutputProtocol {

    func cardPrivateDataLoaded(privateData: CardPrivateData) {
        self.view?.showPrivateData(privateData: privateData)
    }

    func cardPrivateDataHided() {
        self.view?.hidePrivateData()
    }

}
