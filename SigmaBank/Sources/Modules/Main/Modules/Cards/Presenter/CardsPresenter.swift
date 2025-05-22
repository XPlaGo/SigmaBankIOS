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
        self.view?.show(accounts: [])
        interactor.loadAcounts()
    }
    
    func presendCardModule(for card: Card) {
        self.router.goToCardModule(of: card)
    }
    
}

extension CardsPresenter: CardsInteractorOutputProtocol {
    
    func accountsLoading() {
        view?.showLoading()
    }
    
    func accountsLoaded(accounts: [Account]) {
        view?.hideLoading()
        view?.setAccounts(accounts: accounts)
    }

}
