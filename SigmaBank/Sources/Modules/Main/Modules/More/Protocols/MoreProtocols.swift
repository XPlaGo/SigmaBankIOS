import UIKit

protocol MoreViewProtocol: AnyObject {

    func show()

}

protocol MorePresenterProtocol: AnyObject {

    func viewDidLoad(view: MoreViewProtocol)
    
    func logout()

}

protocol MoreInteractorInputProtocol: AnyObject {
    
    func logout()

}

protocol MoreInteractorOutputProtocol: AnyObject {
    
    func logoutDidFinish()

}

protocol MoreRouterProtocol: AnyObject {

    func goToProfileModule()
    
    func goToAuthModule()

}

protocol MoreBuilderProtocol: AnyObject {
    
    func build() -> UIViewController
    
}
