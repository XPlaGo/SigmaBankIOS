import UIKit

struct DSButtonViewModel {
    let title: String?
    let size: DSButtonSize
    let style: DSButtonStyle
    let isEnabled: Bool
    let isLoading: Bool
    let image: UIImage?
    let onTap: (() -> Void)?
    
    init(title: String? = nil,
         size: DSButtonSize = .medium,
         style: DSButtonStyle = .primary,
         isEnabled: Bool = true,
         isLoading: Bool = false,
         image: UIImage? = nil,
         onTap: (() -> Void)? = nil) {
        self.title = title
        self.size = size
        self.style = style
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.image = image
        self.onTap = onTap
    }
}
