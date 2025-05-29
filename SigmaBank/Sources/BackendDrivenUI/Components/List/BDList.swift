import UIKit

class BDList: BDComponent {

    private let view: DSList

    required init () {
        view = DSList()
    }

    func configure(with options: [String : Any]) {
        
        let items = options["items"] as! [UIView]
        
        items.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        let viewModel = DSListViewModel(
            direction: DSListDirection(rawValue: options["direction"] as! String)!,
            items: items,
            size: DSListSize(rawValue: options["size"] as! String)!,
            style: DSListStyle(rawValue: options["style"] as! String)!,
            filling: DSListFilling(rawValue: options["filling"] as! String)!,
            itemLength: CGFloat(options["itemLength"] as! Float),
            itemIdentifier: options["itemIdentifier"] as! String)

        view.configure(with: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }

}
