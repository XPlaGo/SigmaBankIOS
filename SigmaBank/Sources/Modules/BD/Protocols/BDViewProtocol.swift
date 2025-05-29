import UIKit

protocol BDViewProtocol: AnyObject {
    
    func setContent(_ view: UIView)

    func show()
    
    func showLoading()
    
    func hideLoading()

}
