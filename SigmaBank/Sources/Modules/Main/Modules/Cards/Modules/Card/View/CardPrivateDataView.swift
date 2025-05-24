import UIKit

public class CardPrivateDataView: UIView {
    
    weak var presenter: CardsPresenterProtocol?
    
    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            numberLabel.setText("\(card?.cardNumber.value ?? "****-****-****-****")")
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
                expirityLabel.setText(formatter.string(from: expDate!))
            }

            codeLabel.setText("\(privateData?.cardCode ?? "***")")
        }
    }
    
    private lazy var numberLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "****-****-****-****",
            style: .content,
            size: .bodyLarge,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var expirityLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "**/**",
            style: .content,
            size: .bodyLarge,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var codeLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "***",
            style: .content,
            size: .bodyLarge,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [numberLabel, stackSubView],
            size: .medium,
            alignment: .fill)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackSubView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .horizontal,
            items: [expirityLabel, codeLabel],
            size: .small,
            distribution: .fillEqually)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardView: DSCard = {
        let viewModel = DSCardViewModel(
            content: stackView,
            style: .content,
            size: .large,
            showShadow: false
        )
        let view = DSCard()
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(cardView)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

