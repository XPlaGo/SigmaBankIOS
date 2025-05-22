import UIKit

public class CardPrivateDataView: UIView {
    
    weak var presenter: CardsPresenterProtocol?
    
    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            numberLabel.text = "\(card?.cardNumber.value ?? "****-****-****-****")"
        }
    }

    var privateData: CardPrivateData? {
        didSet {
            guard privateData != nil else {
                return
            }
            
            let expDate = privateData?.cardExpirationDate
            
            if (expDate != nil) {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/yy"
                expirityLabel.text = formatter.string(from: expDate!)
            }

            codeLabel.text = "\(privateData?.cardCode ?? "***")"
        }
    }
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "****-****-****-****"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var expirityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "**/**"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()

    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "***"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private lazy var stackSubView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
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

extension CardPrivateDataView {
    func show() {
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray5

        self.addSubview(stackView)

        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(stackSubView)

        stackSubView.addArrangedSubview(expirityLabel)
        stackSubView.addArrangedSubview(codeLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}

