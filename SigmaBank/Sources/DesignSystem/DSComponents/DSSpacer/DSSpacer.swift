import UIKit

class DSSpacer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DSSpacer {
    
    func setup() {
        setContentHuggingPriority(.defaultLow, for: .vertical)
    }

}
