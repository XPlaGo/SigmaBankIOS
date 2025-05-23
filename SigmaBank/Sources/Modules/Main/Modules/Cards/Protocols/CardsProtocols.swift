import UIKit

protocol CardsViewProtocol: AnyObject {

    func show(accounts: [Account])
    
    func showLoading()
    
    func hideLoading()
    
    func setAccounts(accounts: [Account])

}

protocol CardsPresenterProtocol: AnyObject {

    func viewDidLoad(view: CardsViewProtocol)

    func presendCardModule(for card: Card)

}

protocol CardsInteractorInputProtocol: AnyObject {

    func loadAcounts()

}

protocol CardsInteractorOutputProtocol: AnyObject {
    
    func accountsLoading()

    func accountsLoaded(accounts: [Account])

}

protocol CardsRouterProtocol: AnyObject {

    func goToCardModule(of card: Card)

}

protocol CardsBuilderProtocol: AnyObject {
    
    func build() -> UIViewController

}
