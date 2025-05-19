import UIKit

class CardsViewController: UIViewController {
    
    private let presenter: CardsPresenterProtocol
    
    private var accounts: [Account] = []
    
    private lazy var indicator: UIActivityIndicatorView = {
        var view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 190)

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        view.register(AccountCellView.self, forCellWithReuseIdentifier: "AccountCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        return view
    }()
    
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

extension CardsViewController: CardsViewProtocol {

    func show(accounts: [Account]) {
        self.accounts = accounts

        self.view.backgroundColor = .systemBackground

        self.view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}

extension CardsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.accounts[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCellView
        cell.presenter = self.presenter
        cell.account = item
        return cell
    }
    
}
