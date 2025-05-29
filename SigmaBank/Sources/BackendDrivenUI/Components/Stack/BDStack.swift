import UIKit

class BDStack: BDComponent {

    private let view: DSStack

    required init () {
        view = DSStack()
    }

    func configure(with options: [String : Any]) {
        
        let items = options["items"] as! [UIView]
        
        items.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        let viewModel = DSStackViewModel(
            axis: DSStackAxis(rawValue: options["axis"] as! String)!,
            items: items,
            size: DSStackSize(rawValue: options["size"] as! String)!,
            alignment: DSStackAlignment(rawValue: options["alignment"] as! String)!,
            distribution: DSStackDistribution(rawValue: options["distribution"] as! String)!,
            spacing: getSpacing(options["spacing"] as? Float))

        view.configure(viewModel: viewModel)
    }
    
    func getView() -> UIView {
        return view
    }
    
    func getSpacing(_ value: Float?) -> CGFloat? {
        guard value != nil else { return nil }
        return CGFloat(value!)
    }

}
