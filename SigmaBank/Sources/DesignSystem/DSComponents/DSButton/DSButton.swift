import UIKit

class DSButton: UIButton {
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: DSButtonViewModel) {
        var config: UIButton.Configuration
        
        switch viewModel.style {
        case .primary:
            config = .filled()
            config.baseBackgroundColor = DSColors.primary
            config.baseForegroundColor = DSColors.primaryText
        case .secondary:
            config = .filled()
            config.baseBackgroundColor = DSColors.secondary
            config.baseForegroundColor = DSColors.secondaryText
            config.background.strokeWidth = 1
        case .danger:
            config = .filled()
            config.baseBackgroundColor = DSColors.danger
            config.baseForegroundColor = DSColors.dangerText
        case .ghost:
            config = .filled()
            config.baseBackgroundColor = DSColors.background
            config.baseForegroundColor = DSColors.backgroundText
            config.background.strokeWidth = 1
        }
        
        config.background.cornerRadius = DSSizes.Button.borderRadius(for: viewModel.size)
        
        if viewModel.isLoading {
            config.title = nil
            config.image = nil
            switch viewModel.style {
            case .primary, .danger:
                spinner.color = DSColors.primaryText
            case .secondary:
                spinner.color = DSColors.secondaryText
            case .ghost:
                spinner.color = DSColors.backgroundText
            }
            spinner.startAnimating()
            isUserInteractionEnabled = false;
        } else {
            config.title = viewModel.title
            config.image = viewModel.image
            config.imagePlacement = .leading
            config.imagePadding = DSSpacings.Button.imageTitleSpacing(for: viewModel.size)
            spinner.stopAnimating()
            isUserInteractionEnabled = viewModel.isEnabled
            self.isEnabled = viewModel.isEnabled
        }

        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incomimg in
            var outgoing = incomimg
            outgoing.font = DSFonts.buttonFont(for: viewModel.size)
            return outgoing
        }
        
        let padding = DSSpacings.Button.padding(for: viewModel.size)
        config.contentInsets = NSDirectionalEdgeInsets(
            top: padding.top,
            leading: padding.left,
            bottom: padding.bottom,
            trailing: padding.right,
        )
        
        if !viewModel.isEnabled && !viewModel.isEnabled {
            config.baseBackgroundColor = DSColors.disabled
            config.baseForegroundColor = DSColors.disabledText
        }
        
        self.configuration = config
    }
    
}
