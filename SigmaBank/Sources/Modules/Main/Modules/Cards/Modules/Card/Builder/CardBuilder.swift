import UIKit

public class CardBuilder: CardBuilderProtocol {
    
    private let accountService: AccountServiceProtocol
    
    init (accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }

    func build(card: Card) -> UIViewController {
        let router = CardRouter()
        let interactor = CardInteractor(accountsService: accountService)
        let presenter = CardPresenter(router: router, interactor: interactor)
        let view = CardViewController(card: card, presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }
    
}
