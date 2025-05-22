import UIKit

class MainPresenter : MainPresenterProtocol {
    
    private weak var view: MainViewProtocol?
    
    private let router: MainRouterProtocol
    
    private let interactor: MainInteractorInputProtocol
    
    init(router: MainRouterProtocol,
         interactor: MainInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: any MainViewProtocol) {
        self.view = view
        view.show()
    }
    
    func getCardsModule() -> UIViewController {
        return router.getCardsModule()
    }
    
    func getHistoryModule() -> UIViewController {
        return router.getHistoryModule()
    }
    
    func getMoreModule() -> UIViewController {
        return router.getMoreModule()
    }
    
    func getTransfersModule() -> UIViewController {
        return router.getTransfersModule()
    }

}

extension MainPresenter: MainInteractorOutputProtocol {

}
