class MorePresenter: MorePresenterProtocol {
    
    private weak var view: MoreViewProtocol?

    private let router: MoreRouterProtocol

    private let interactor: MoreInteractorInputProtocol
    
    init(router: MoreRouterProtocol, interactor: MoreInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: MoreViewProtocol) {
        self.view = view
        self.view?.show()
    }
    
    func logout() {
        self.interactor.logout()
    }
    
    
}

extension MorePresenter: MoreInteractorOutputProtocol {

    func logoutDidFinish() {
        self.router.goToAuthModule()
    }
    
}
