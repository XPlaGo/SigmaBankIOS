import UIKit

class DSLabel: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(_ text: String) {
        label.text = text
    }
    
    func configure(viewModel: DSLabelViewModel) {
        layoutMargins = DSSpacings.Label.margin(for: viewModel.size)
        
        label.text = viewModel.text
        label.font = DSFonts.labelFonts(for: viewModel.size)
        
        switch viewModel.alignment {
        case .left:
            label.textAlignment = .left
        case .center:
            label.textAlignment = .center
        case .right:
            label.textAlignment = .right
        case .justified:
            label.textAlignment = .justified
        case .natural:
            label.textAlignment = .natural
        }
        
        switch viewModel.style {
        case .primary:
            label.textColor = DSColors.primaryText
        case .secondary:
            label.textColor = DSColors.secondaryText
        case .danger:
            label.textColor = DSColors.dangerText
        case .ghost:
            label.textColor = DSColors.backgroundText
        case .content:
            label.textColor = DSColors.contentText
        }
    }
}

extension DSLabel {
    
    private func setup() {

        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
}
