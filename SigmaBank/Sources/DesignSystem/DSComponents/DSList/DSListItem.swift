import UIKit

class DSListItem: UICollectionViewCell {
    static let reuseIdentifier = "DSListItem"
    
    var innerView: UIView? {
        didSet {
            show()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DSListItem {

    func show() {
        guard innerView != nil else { return }
        
        innerView?.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(innerView!)

        NSLayoutConstraint.activate([
            innerView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            innerView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            innerView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            innerView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

}
