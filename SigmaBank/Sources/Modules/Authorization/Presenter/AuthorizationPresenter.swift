import Foundation

class AuthorizationPresenter: AuthorizationPresenterProtocol {

    private weak var view: AuthorizationViewProtocol?

    private let router: AuthorizationRouterProtocol

    private let interactor: AuthorizationInteractorInputProtocol

    init(router: AuthorizationRouterProtocol,
         interactor:AuthorizationInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad(view: any AuthorizationViewProtocol) {
        self.view = view
        view.show()
        interactor.checkCurrentUserAuthentication()
    }

}

extension AuthorizationPresenter: AuthorizationInteractorOutputProtocol {
    
    func loadingAuthentication() {
        view?.showLoading()
    }

    func userAuthenticationFound() {
        view?.hideLoading()
        router.goToMainModule()
    }
    
    func userAuthenticationNotFound() {
        view?.hideLoading()
        router.goToPhoneNumberModule()
    }

}
