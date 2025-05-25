import UIKit

class BDInput: BDComponent {

    private let view: DSInput

    required init () {
        view = DSInput()
    }

    func configure(with options: [String : Any]) {
        let viewModel = DSInputViewModel(
            style: DSInputStyle(rawValue: options["style"] as! String)!,
            size: DSInputSize(rawValue: options["size"] as! String)!,
            placeholder: options["placeholder"] as? String,
            image: getImage(options["image"] as? String),
            isEnabled: options["isEnabled"] as! Bool)

        view.configure(viewModel: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }
    
    func getImage(_ systemName: String?) -> UIImage? {
        guard systemName != nil else { return nil }
        return UIImage(systemName: systemName!)
    }

}
