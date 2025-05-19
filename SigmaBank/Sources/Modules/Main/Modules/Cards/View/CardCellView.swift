import UIKit

public class CardCellView: UICollectionViewCell {
    
    var card: Card? {
        didSet {
            guard card != nil else {
                return
            }
            cardView?.card = card
        }
    }
    
    weak var presenter: CardsPresenterProtocol? {
        didSet {
            cardView?.presenter = presenter
        }
    }
    
    private var cardView: CardView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CardCellView {
    func show() {
        guard cardView == nil else { return }
        
        cardView = cardView ?? CardView()

        cardView?.presenter = presenter
        cardView?.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(cardView!)

        NSLayoutConstraint.activate([
            cardView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
