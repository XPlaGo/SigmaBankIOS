import UIKit

class BDRouter: BDRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func goToScreen(title: String, by path: String) {
        let controller = BDBuilder().build(title: title, path: path)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }

}
