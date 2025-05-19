import UIKit

protocol CardViewProtocol: AnyObject {

    func show(card: Card)
    
    func showPrivateData(privateData: CardPrivateData)
    
    func hidePrivateData()

}

protocol CardPresenterProtocol: AnyObject {

    func viewDidLoad(view: CardViewProtocol, card: Card)
    
    func loadPrivateData(for card: Card)

}

protocol CardInteractorInputProtocol: AnyObject {

    func loadPrivateData(for card: Card)
    
    func hidePrivateData()

}

protocol CardInteractorOutputProtocol: AnyObject {

    func cardPrivateDataLoaded(privateData: CardPrivateData)
    
    func cardPrivateDataHided()

}

protocol CardRouterProtocol: AnyObject {

}

protocol CardBuilderProtocol: AnyObject {
    
    func build(card: Card) -> UIViewController

}
