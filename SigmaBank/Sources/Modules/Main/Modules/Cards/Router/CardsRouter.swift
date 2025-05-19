import UIKit

public class CardsRouter: CardsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    private let accountService: AccountServiceProtocol
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
    
    func goToCardModule(of card: Card) {
        let moduleViewController = CardBuilder(accountService: accountService).build(card: card)
        self.viewController?.navigationController?.pushViewController(moduleViewController, animated: true)
    }

}
