import UIKit

class BDIcon: BDComponent {
    
    private let view: DSIcon

    required init () {
        view = DSIcon()
    }

    func configure(with options: [String : Any]) {
        let viewModel = DSIconViewModel(
            systemName: options["systemName"] as! String,
            size: DSIconSize(rawValue: options["size"] as! String)!,
            style: DSIconStyle(rawValue:  options["style"] as! String)!)

        view.configure(with: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }
    
}
