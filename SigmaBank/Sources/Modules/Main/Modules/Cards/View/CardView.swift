import UIKit

public class CardView: UIView {
    
    var cardAction: ((Card) -> Void)?

    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            numberLabel.setText("\(card?.cardNumber.value.suffix(4) ?? "****")")
            
            let type = switch card?.cardType {
            case .mastercard: "MC";
            case .visa: "VISA";
            case .mir: "MIR";
            default:
                "*"
            }
            typeLabel.setText(type)
            
            setupHero()
        }
    }
    
    private lazy var numberLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "****",
            style: .primary,
            size: .labelLarge,
            alignment: .left)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "*",
            style: .primary,
            size: .labelLarge,
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
            size: .small,
            distribution: .fill)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardView: DSCard = {
        let viewModel = DSCardViewModel(
            content: cardStackView,
            style: .primary,
            size: .small,
            showShadow: false)
        let view = DSCard()
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupTap()
        show()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCardTap))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    private func setupHero() {
        if card != nil {
            let prefix = "card=\(card!.cardId.value)"
            cardView.hero.id = prefix
        }
    }

}

extension CardView {
    func show() {
        self.layer.cornerRadius = 5
        self.backgroundColor = .systemBlue

        self.addSubview(cardView)
        
        setupHero()

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc
    func onCardTap() {
        switch card {
        case .none:
            print("Error")
        case .some(let card):
            cardAction?(card)
        }
    }
}

