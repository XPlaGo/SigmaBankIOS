import UIKit

class DSInput: UITextField {
    
    private var viewModel: DSInputViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configure(viewModel: DSInputViewModel) {
        self.viewModel = viewModel
        
        switch viewModel.style {
        case .secondary:
            backgroundColor = DSColors.secondary
            textColor = DSColors.secondaryText
        case .ghost:
            backgroundColor = DSColors.background
            textColor = DSColors.backgroundText
        case .content:
            backgroundColor = DSColors.content
            textColor = DSColors.contentText
        }
        layer.cornerRadius = DSSizes.Input.borderRadius(for: viewModel.size)
        
        font = DSFonts.inputFont(for: viewModel.size)
        
        isEnabled = viewModel.isEnabled
        
        if let image = viewModel.image {
            let image = UIImageView(image: image)
            image.contentMode = .scaleAspectFit
            
            let padding = DSSpacings.Input.padding(for: viewModel.size)
            let containerView = UIView(frame: CGRect(
                x: 0,
                y: 0,
                width: image.frame.width + padding.left,
                height: image.frame.height + padding.top + padding.bottom))

            image.frame = CGRect(x: padding.left, y: padding.top, width: image.frame.width, height: image.frame.height)
            containerView.addSubview(image)
            
            leftView = containerView
            leftViewMode = .always
        }
        
        if let placeholder = viewModel.placeholder {
            let placeholderColor = switch viewModel.style {
            case .secondary: DSColors.secondaryText.withAlphaComponent(0.5)
            case .ghost: DSColors.backgroundText.withAlphaComponent(0.5)
            case .content: DSColors.contentText.withAlphaComponent(0.5)
            }
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: placeholderColor
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if viewModel == nil {
            return super.textRect(forBounds: bounds)
        } else {
            return super
                .textRect(forBounds: bounds)
                .inset(by: DSSpacings.Input.padding(for: viewModel!.size))
        }
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        if viewModel == nil {
            return super.editingRect(forBounds: bounds)
        } else {
            return super
                .editingRect(forBounds: bounds)
                .inset(by: DSSpacings.Input.padding(for: viewModel!.size))
        }
    }
    
}

extension DSInput {
    
    func setup() {
        autocorrectionType = .no
        autocapitalizationType = .none
        clipsToBounds = true
    }
    
}
