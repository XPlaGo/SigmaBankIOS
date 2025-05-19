class CardsPresenter: CardsPresenterProtocol {
    
    private weak var view: CardsViewProtocol?

    private let router: CardsRouterProtocol

    private let interactor: CardsInteractorInputProtocol

    init(router: CardsRouterProtocol,
         interactor: CardsInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad(view: any CardsViewProtocol) {
        self.view = view
        interactor.loadAcounts()
    }
    
    func presendCardModule(for card: Card) {
        self.router.goToCardModule(of: card)
    }
    
}

extension CardsPresenter: CardsInteractorOutputProtocol {
    
    func accountsLoaded(accounts: [Account]) {
        self.view?.show(accounts: accounts)
    }

}
