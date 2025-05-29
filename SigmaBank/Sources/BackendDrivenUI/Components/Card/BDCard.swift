import UIKit

class BDCard: BDComponent {

    private let view: DSCard

    required init () {
        view = DSCard()
    }

    func configure(with options: [String : Any]) {
        let viewModel = DSCardViewModel(
            content: options["content"] as! UIView,
            style: DSCardStyle(rawValue: options["style"] as! String)!,
            size: DSCardSize(rawValue: options["size"] as! String)!,
            showShadow: options["showShadow"] as! Bool)

        view.configure(with: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }

}
