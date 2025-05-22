import UIKit
import SVProgressHUD

class CardViewController: UIViewController {
    
    private let presenter: CardPresenterProtocol
    
    private var card: Card
    private var privateData: CardPrivateData?
    
    private var showPrivateData: Bool = false
    
    private lazy var numberLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "***\(card.cardNumber.value.suffix(4))",
            style: .primary,
            size: .headerLarge,
            alignment: .left)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeLabel: DSLabel = {
        let text = switch card.cardType {
        case .mastercard: "MC";
        case .visa: "VISA";
        case .mir: "MIR";
        default:
            "*"
        }
        
        let viewModel = DSLabelViewModel(
            text: text,
            style: .primary,
            size: .headerLarge,
            alignment: .left)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardStackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .horizontal,
            items: [numberLabel, typeLabel],
            size: .medium)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardView: DSCard = {
        let viewModel = DSCardViewModel(
            content: cardStackView,
            style: .primary,
            size: .large,
            showShadow: true)
        let view = DSCard()
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardInfoLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "Card Info",
            style: .ghost,
            size: .headerMedium,
            alignment: .left)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var privateDataView: CardPrivateDataView = {
        let view = CardPrivateDataView()
        view.card = card
        return view
    }()
    
    private lazy var showPrivateDataButton: DSButton = {
        let viewModel = DSButtonViewModel(
            title: "Show private info",
            size: .large,
            style: .secondary,
            image: UIImage(systemName: "eye"),
        )
        let button = DSButton()
        button.configure(with: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePrivateData), for: .touchUpInside)
        return button
    }()
    
    private lazy var spacer: DSSpacer = {
        return DSSpacer()
    }()
    
    private lazy var stackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [cardView, cardInfoLabel, privateDataView, showPrivateDataButton, spacer],
            size: .large,
            distribution: .fill)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupHero() {
        let prefix = "card=\(card.cardId.value)"
        cardView.hero.id = prefix
    }
    
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
        self.hero.isEnabled = true

        self.title = "Details"
        self.card = card
        
        setupHero()

        self.view.backgroundColor = .systemBackground

        self.view.addSubview(stackView)
        
        privateDataView.isHidden = !showPrivateData

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cardView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75, constant: -45),
        ])
    }
    
    func cardPrivateDataLoading(_ enabled: Bool) {
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(DSColors.secondary)
        SVProgressHUD.setForegroundColor(DSColors.secondaryText)
    }
    
    func showPrivateData(privateData: CardPrivateData) {
        SVProgressHUD.dismiss()
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
