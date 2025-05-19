import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewProtocol?
    
    private let accountService: AccountServiceProtocol
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }

    func getCardsModule() -> UIViewController {
        return CardsBuilder(accountService: accountService).build()
    }
    
    func getHistoryModule() -> UIViewController {
        return UIViewController()
    }
    
    func getMoreModule() -> UIViewController {
        return UIViewController()
    }
    
    func getTransfersModule() -> UIViewController {
        return UIViewController()
    }

}
