import UIKit

class DSCard: UIView {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contentView: UIView? {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: DSCardViewModel) {
        
        contentView = viewModel.content
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        let padding = DSSpacings.Card.padding(for: viewModel.size)
        backgroundView.layoutMargins = padding
        
        switch viewModel.style {
        case .primary:
            backgroundView.backgroundColor = DSColors.primary
        case .secondary:
            backgroundView.backgroundColor = DSColors.secondary
        case .danger:
            backgroundView.backgroundColor = DSColors.danger
        case .ghost:
            backgroundView.backgroundColor = DSColors.background
        case .content:
            backgroundView.backgroundColor = DSColors.content
        }
        
        if viewModel.showShadow {
            let shadow = DSShadows.Card.shadow(for: viewModel.style)
            backgroundView.layer.shadowColor = shadow.color
            backgroundView.layer.shadowOpacity = shadow.opacity
            backgroundView.layer.shadowOffset = shadow.offset
            backgroundView.layer.shadowRadius = shadow.radius
        }
        
        backgroundView.layer.cornerRadius = DSSizes.Card.borderRadius(for: viewModel.size)
    }
    
}

extension DSCard {
    
    private func setup() {
        addSubview(backgroundView)
        
        if contentView != nil {
            backgroundView.addSubview(contentView!)
        }
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        if contentView != nil {
            NSLayoutConstraint.activate([
                contentView!.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor),
                contentView!.bottomAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.bottomAnchor),
                contentView!.leadingAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.leadingAnchor),
                contentView!.trailingAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.trailingAnchor),
            ])
        }
    }
    
}
