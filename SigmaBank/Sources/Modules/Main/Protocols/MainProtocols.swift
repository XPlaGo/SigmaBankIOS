import UIKit

protocol MainViewProtocol: AnyObject {

    func show()

}

protocol MainPresenterProtocol: AnyObject {

    func viewDidLoad(view: MainViewProtocol)

    func getCardsModule() -> UIViewController

    func getHistoryModule() -> UIViewController

    func getMoreModule() -> UIViewController

    func getTransfersModule() -> UIViewController

}

protocol MainInteractorInputProtocol: AnyObject {

}

protocol MainInteractorOutputProtocol: AnyObject {

}

protocol MainRouterProtocol: AnyObject {

    func getCardsModule() -> UIViewController
    
    func getHistoryModule() -> UIViewController

    func getMoreModule() -> UIViewController

    func getTransfersModule() -> UIViewController

}

protocol MainBuilderProtocol: AnyObject {

    func build() -> UIViewController

}
