import UIKit

public class CardsBuilder: CardsBuilderProtocol {
    
    private let accountService: AccountServiceProtocol
    
    init (accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
    
    func build() -> UIViewController {
        let router = CardsRouter(accountService: accountService)
        let interactor = CardsInteractor(accountsService: accountService)
        let presenter = CardsPresenter(router: router, interactor: interactor)
        let view = CardsViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
