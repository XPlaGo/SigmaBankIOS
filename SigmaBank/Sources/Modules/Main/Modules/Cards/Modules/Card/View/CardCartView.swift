import UIKit

public class CardCartView: UIView {
    
    weak var presenter: CardsPresenterProtocol?

    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            numberLabel.text = "***\(card?.cardNumber.value.suffix(4) ?? "****")"
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
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*"
        label.font = .systemFont(ofSize: 32, weight: .bold)
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
        show()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CardCartView {
    func show() {
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemBlue

        self.addSubview(cardStackView)

        cardStackView.addArrangedSubview(numberLabel)
        cardStackView.addArrangedSubview(typeLabel)

        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cardStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            cardStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cardStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}

