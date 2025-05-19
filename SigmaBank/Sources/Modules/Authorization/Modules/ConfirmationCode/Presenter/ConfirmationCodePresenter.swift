import Foundation

class ConfirmationCodePresenter: ConfirmationCodePresenterProtocol {

    private weak var view: ConfirmationCodeViewProtocol?

    private let router: ConfirmationCodeRouterProtocol

    private let interactor: ConfirmationCodeInteractorInputProtocol

    init(router: ConfirmationCodeRouterProtocol,
         interactor: ConfirmationCodeInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad(view: any ConfirmationCodeViewProtocol) {
        self.view = view
        view.show()
    }
    
    func confirm(code: String) {
        self.interactor.confirm(code: code)
    }

}

extension ConfirmationCodePresenter: ConfirmationCodeInteractorOutputProtocol {
    
    func confirmLoading() {
        self.view?.setLoading(true)
    }
    
    func confirmSuccess() {
        self.view?.setLoading(false)
        self.view?.setConfirmError(error: nil)
        self.interactor.login()
    }
    
    func confirmRegistrationRequired() {
        self.view?.setLoading(false)
        self.view?.setConfirmError(error: nil)
        self.router.goToUserRegistrationModule()
    }
    
    func confirmError(error: ConfirmError) {
        self.view?.setLoading(false)
        self.view?.setConfirmError(error: error)
    }
    
    func loginSuccess() {
        self.view?.setLoading(false)
        self.view?.setConfirmError(error: nil)
        self.router.goToMainModule()
    }

}
