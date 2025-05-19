import UIKit

public class CardView: UIView {
    
    weak var presenter: CardsPresenterProtocol?

    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            numberLabel.text = "\(card?.cardNumber.value.suffix(4) ?? "****")"
            typeLabel.text = switch card?.cardType {
            case .mastercard: "MC";
            case .visa: "VISA";
            case .mir: "MIR";
            default:
                "*"
            }
        }
    }
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "****"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var cardStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
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

}

extension CardView {
    func show() {
        
        self.layer.cornerRadius = 5
        self.backgroundColor = .systemBlue

        self.addSubview(cardStackView)

        cardStackView.addArrangedSubview(numberLabel)
        cardStackView.addArrangedSubview(typeLabel)

        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cardStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            cardStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            cardStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
    
    @objc
    func onCardTap() {
        switch card {
        case .none:
            print("Error")
        case .some(let card):
            self.presenter?.presendCardModule(for: card)
        }
    }
}

