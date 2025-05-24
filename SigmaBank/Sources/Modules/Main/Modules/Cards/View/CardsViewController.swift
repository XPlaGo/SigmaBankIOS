import UIKit
import SVProgressHUD

class CardsViewController: UIViewController {
    
    private let presenter: CardsPresenterProtocol
    
    var accounts: [Account] = []
    
    private lazy var listView: DSList = {
        let items = accounts.map(mapAccountToView)
        
        let viewModel = DSListViewModel(
            direction: .vertical,
            items: items,
            size: .large,
            style: .content,
            filling: .fill,
            itemLength: 200,
            itemIdentifier: "AccountCell",
        )
        
        let view = DSList(frame: .zero)
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func mapAccountToView(_ account: Account) -> UIView {
        let accountView = AccountView()
        accountView.translatesAutoresizingMaskIntoConstraints = false
        accountView.cardAction = onCardTapped
        accountView.account = account
        return accountView
    }
    
    init(presenter: CardsPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
    }
    
}

extension CardsViewController {
    
    private func onCardTapped(card: Card) {
        presenter.presendCardModule(for: card)
    }
    
}

extension CardsViewController: CardsViewProtocol {

    func show(accounts: [Account]) {
        self.accounts = accounts
        
        view.addSubview(listView)

        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.topAnchor),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func showLoading() {
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(DSColors.secondary)
        SVProgressHUD.setForegroundColor(DSColors.secondaryText)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func setAccounts(accounts: [Account]) {
        self.accounts = accounts
        self.listView.setItems(accounts.map(mapAccountToView))
    }
    
}
