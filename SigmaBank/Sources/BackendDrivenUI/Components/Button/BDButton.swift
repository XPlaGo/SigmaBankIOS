import UIKit

class BDButton: BDComponent {

    private let view: DSButton

    required init () {
        view = DSButton()
    }

    func configure(with options: [String : Any]) {
        let viewModel = DSButtonViewModel(
            title: options["title"] as? String,
            size: DSButtonSize(rawValue: options["size"] as! String)!,
            style: DSButtonStyle(rawValue: options["style"] as! String)!,
            isEnabled: options["isEnabled"] as! Bool,
            isLoading: options["isLoading"] as! Bool,
            image: getImage(options["image"] as? String),
            onTap: getOnTap(options["onTap"] as? BDViewModel.Action),
        )

        view.configure(with: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }
    
    func getImage(_ systemName: String?) -> UIImage? {
        guard systemName != nil else { return nil }
        return UIImage(systemName: systemName!)
    }

    private func getOnTap(_ onTap: BDViewModel.Action?) -> () -> Void {
        if let onTap = onTap {
            return {
                NotificationCenter.default.post(
                    name: NSNotification.Name(onTap.type),
                    object: onTap.context,
                    userInfo: onTap.context,
                )
            }
        }
        
        return {}
    }
}
