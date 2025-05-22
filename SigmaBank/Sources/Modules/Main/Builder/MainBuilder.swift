import UIKit

class MainBuilder: MainBuilderProtocol {
    
    private let accountServuce: AccountServiceProtocol
    
    init(accountService: AccountServiceProtocol) {
        self.accountServuce = accountService
    }

    func build() -> UIViewController {
        let router = MainRouter(accountService: accountServuce)
        let interactor = MainInteractor()
        let presenter = MainPresenter(router: router, interactor: interactor)
        let viewController = MainViewController(presenter: presenter)
        
        router.viewController = viewController
        interactor.output = presenter

        return viewController
    }
}
