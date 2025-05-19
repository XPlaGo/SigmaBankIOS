import UIKit

public class AccountView: UIView {
    
    weak var presenter: CardsPresenterProtocol?
    
    var account: Account? {
        didSet {
            guard account != nil else {
                return
            }
            amountLabel.text = "\(account?.amount ?? 0) U"
        }
    }
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "**"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var cardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 80, height: 50)
        layout.scrollDirection = .horizontal

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CardCellView.self, forCellWithReuseIdentifier: "CardCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        return view
    }()
    
    private lazy var topUpButton: UIButton = {
        var config = UIButton.Configuration.gray()
        config.buttonSize = .medium
        config.title = "Top Up"
        config.image = UIImage(systemName: "plus")
        config.imagePadding = 4
        config.baseForegroundColor = .label.withAlphaComponent(0.7)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var transferButton: UIButton = {
        var config = UIButton.Configuration.gray()
        config.buttonSize = .medium
        config.title = "Transfer"
        config.image = UIImage(systemName: "arrow.right")
        config.imagePadding = 4
        config.baseForegroundColor = .label.withAlphaComponent(0.7)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var actionsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    private lazy var accountStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        show()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountView {
    func show() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray6

        self.addSubview(accountStackView)

        accountStackView.addArrangedSubview(amountLabel)
        accountStackView.addArrangedSubview(cardsCollectionView)
        accountStackView.addArrangedSubview(actionsStackView)
        
        actionsStackView.addArrangedSubview(topUpButton)
        actionsStackView.addArrangedSubview(transferButton)
        
        cardsCollectionView.backgroundColor = nil

        NSLayoutConstraint.activate([
            accountStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            accountStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            accountStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            accountStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}

extension AccountView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        account?.cards.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.account?.cards[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCellView
        cell.presenter = self.presenter
        cell.card = item
        return cell
    }
    
}
