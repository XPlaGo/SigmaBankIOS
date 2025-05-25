import UIKit

protocol BDComponent {
    
    init()
    
    func configure(with options: [String: Any])
    
    func getView() -> UIView
    
}
