import Foundation
import UIKit

class BDPresenter: BDPresenterProtocol {
    
    
    private weak var view: BDViewProtocol?

    private let router: BDRouterProtocol

    private let interactor: BDInteractorInputProtocol

    init(router: BDRouterProtocol, interactor: BDInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad(view: any BDViewProtocol, by path: String) {
        self.view = view
        view.show()
        interactor.loadScreen(by: path)
    }
    
    func goToScreen(title: String, by path: String) {
        self.router.goToScreen(title: title, by: path)
    }

}

@MainActor
extension BDPresenter: @preconcurrency BDInteractorOutputProtocol {

    func loadingScreen() {
        view?.showLoading()
    }
    
    func screenLoadedSuccess(content: UIView) {
        view?.setContent(content)
        view?.hideLoading()
    }
    
    func screenLoadedError() {
        view?.hideLoading()
    }

}
