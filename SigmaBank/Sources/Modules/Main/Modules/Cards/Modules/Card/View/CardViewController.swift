import UIKit

class CardViewController: UIViewController {
    
    private let presenter: CardPresenterProtocol
    
    private var card: Card
    private var privateData: CardPrivateData?
    
    private var showPrivateData: Bool = false
    
    private lazy var cart: CardCartView = {
        let view = CardCartView()
        view.card = card
        return view
    }()
    
    private lazy var privateDataView: CardPrivateDataView = {
        let view = CardPrivateDataView()
        view.card = card
        return view
    }()
    
    private lazy var showPrivateDataButton: UIButton = {
        var config = UIButton.Configuration.gray()
        config.buttonSize = .medium
        config.title = "Show private info"
        config.image = UIImage(systemName: "eye")
        config.imagePadding = 6
        config.baseForegroundColor = .label
        config.cornerStyle = .large
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(togglePrivateData), for: .touchUpInside)
        return button
    }()
    
    private lazy var spacer: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    init(card: Card, presenter: CardPresenterProtocol) {
        self.card = card
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self, card: card)
    }
    
}

extension CardViewController {
    
    @objc
    func togglePrivateData() {
        if showPrivateData {
            showPrivateData = false
            hidePrivateData()
        } else {
            showPrivateData = true
            presenter.loadPrivateData(for: card)
        }
    }
    
}

extension CardViewController: CardViewProtocol {

    func show(card: Card) {
        self.title = "Details"
        self.card = card

        self.view.backgroundColor = .systemBackground

        self.view.addSubview(stackView)
        
        privateDataView.isHidden = !showPrivateData
        
        stackView.addArrangedSubview(cart)
        stackView.addArrangedSubview(privateDataView)
        stackView.addArrangedSubview(showPrivateDataButton)
        stackView.addArrangedSubview(spacer)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cart.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75, constant: -45),
        ])
    }
    
    func showPrivateData(privateData: CardPrivateData) {
        self.privateData = privateData
        privateDataView.privateData = privateData
        UIView.animate(withDuration: 0.3) { [self] in
            privateDataView.isHidden = false
            showPrivateDataButton.titleLabel?.text = "Hide private info"
            showPrivateDataButton.imageView?.image = UIImage(systemName: "eye.slash")
        }
    }
    
    func hidePrivateData() {
        UIView.animate(withDuration: 0.3) { [self] in
            privateDataView.isHidden = true
            showPrivateDataButton.titleLabel?.text = "Show private info"
            showPrivateDataButton.imageView?.image = UIImage(systemName: "eye")
        }
    }
    
}
