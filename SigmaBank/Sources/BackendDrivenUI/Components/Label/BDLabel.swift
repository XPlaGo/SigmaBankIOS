import UIKit

class BDLabel: BDComponent {

    private let view: DSLabel

    required init () {
        view = DSLabel()
    }

    func configure(with options: [String : Any]) {
        let viewModel = DSLabelViewModel(
            text: options["text"] as! String,
            style: DSLabelStyle(rawValue: options["style"] as! String)!,
            size: DSLabelSize(rawValue: options["size"] as! String)!,
            alignment: DSLabelTextAlignment(rawValue: options["alignment"] as! String)!,
            hasSpacing: options["hasSpacing"] as! Bool,
        )
        
        view.configure(viewModel: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }

}
