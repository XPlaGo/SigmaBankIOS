import UIKit

class BDSpacer: BDComponent {

    private let view: DSSpacer

    required init () {
        view = DSSpacer()
    }

    func configure(with options: [String : Any]) {
    }
    
    func getView() -> UIView {
        return view
    }

}
