import UIKit

class AccountCellView: UICollectionViewCell {
    
    var account: Account? {
        didSet {
            guard account != nil else {
                return
            }
            accountView?.account = account
        }
    }
    
    weak var presenter: CardsPresenterProtocol? {
        didSet {
            accountView?.presenter = presenter
        }
    }
    
    private var accountView: AccountView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AccountCellView {
    func show() {
        guard accountView == nil else { return }
        
        accountView = accountView ?? AccountView()

        accountView?.presenter = presenter
        accountView?.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(accountView!)

        NSLayoutConstraint.activate([
            accountView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            accountView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            accountView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            accountView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
