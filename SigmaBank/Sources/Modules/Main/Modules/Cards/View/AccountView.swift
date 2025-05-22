import UIKit

public class AccountView: UIView {
    
    var cardAction: ((Card) -> Void)?
    
    var account: Account? {
        didSet {
            guard account != nil else {
                return
            }
            amountLabel.setText("\(account?.amount ?? 0) $")
            cardsListView.setItems(account?.cards.map(mapCardToView) ?? [])
        }
    }
    
    private lazy var amountLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "***",
            style: .ghost,
            size: .headerSmall,
            alignment: .left)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardsListView: DSList = {
        
        let items = account?.cards.map(mapCardToView) ?? []
        
        let viewModel = DSListViewModel(
            direction: .horizontal,
            items: items,
            size: .small,
            style: .ghost,
            filling: .fill,
            itemLength: 90,
            itemIdentifier: "CardCell",
        )
        
        let view = DSList(frame: .zero)
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var topUpButton: DSButton = {
        let viewModel = DSButtonViewModel(
            title: "Top Up",
            size: .small,
            style: .secondary,
            image: UIImage(systemName: "plus.app.fill"),
        )
        let button = DSButton()
        button.configure(with: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var transferButton: DSButton = {
        let viewModel = DSButtonViewModel(
            title: "Transfer",
            size: .small,
            style: .secondary,
            image: UIImage(systemName: "arrow.right.square.fill"),
        )
        let button = DSButton()
        button.configure(with: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var actionsStackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .horizontal,
            items: [topUpButton, transferButton],
            size: .small,
            distribution: .fillEqually)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountStackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [amountLabel, cardsListView, actionsStackView],
            size: .small,
            alignment: .fill,
            distribution: .fill)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountCardView: DSCard = {
        let viewModel = DSCardViewModel(
            content: accountStackView,
            style: .ghost,
            size: .large,
            showShadow: true)
        let cardView = DSCard()
        cardView.configure(with: viewModel)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private func mapCardToView(_ card: Card) -> UIView {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.cardAction = cardAction
        cardView.card = card
        return cardView
    }
    
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

        self.addSubview(accountCardView)

        NSLayoutConstraint.activate([
            accountCardView.topAnchor.constraint(equalTo: topAnchor),
            accountCardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            accountCardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            accountCardView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
