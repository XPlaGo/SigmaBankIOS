import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewProtocol?
    
    private let authenticationManager: AuthenticationManagerProtocol
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol,
         authenticationService: AuthenticationServiceProtocol,
         accountService: AccountServiceProtocol) {
        self.authenticationManager = authenticationManager
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func getCardsModule() -> UIViewController {
        return CardsBuilder(accountService: accountService).build()
    }
    
    func getHistoryModule() -> UIViewController {
        return UIViewController()
    }
    
    func getMoreModule() -> UIViewController {
        return MoreBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService).build()
    }
    
    func getTransfersModule() -> UIViewController {
        return UIViewController()
    }

}
