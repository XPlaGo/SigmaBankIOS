import UIKit

protocol BDInteractorOutputProtocol: AnyObject {

    func loadingScreen()
    
    func screenLoadedSuccess(content: UIView)
    
    func screenLoadedError()

}
