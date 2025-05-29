import UIKit

class DSIcon: UIView {
    
    private var iconSize: CGFloat?
    
    private var iconView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: DSIconViewModel) {
        
        var tintColor = DSColors.backgroundText

        switch viewModel.style {
        case .primary: tintColor = DSColors.primaryText
        case .secondary: tintColor = DSColors.secondaryText
        case .danger: tintColor = DSColors.dangerText
        case .ghost: tintColor = DSColors.backgroundText
        case .content: tintColor = DSColors.contentText
        case .success: tintColor = DSColors.success
        }
        
        let size = DSSizes.Icon.size(for: viewModel.size)
        iconSize = size
        
        let image = UIImage(systemName: viewModel.systemName)!
        iconView = UIImageView(frame: CGRect(
            origin: .zero,
            size: CGSize(width: size, height: size)))
        iconView?.image = image
        iconView?.tintColor = tintColor
        iconView?.contentMode = .scaleAspectFit
        
        setup()
    }
    
}

extension DSIcon {
    
    func setup() {
        guard iconView != nil && iconSize != nil else { return }
        
        addSubview(iconView!)
        iconView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView!.topAnchor.constraint(equalTo: topAnchor),
            iconView!.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconView!.widthAnchor.constraint(equalToConstant: iconSize!),
            iconView!.heightAnchor.constraint(equalToConstant: iconSize!),
            
            widthAnchor.constraint(equalToConstant: iconSize!),
            heightAnchor.constraint(equalToConstant: iconSize!),
        ])
    }
    
}
