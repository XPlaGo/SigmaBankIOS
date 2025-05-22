import UIKit

extension DSSpacings {
    
    struct Button {
        
        static func padding(for size: DSButtonSize) -> UIEdgeInsets {
            switch size {
            case .small: return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            case .medium: return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
            case .large: return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            }
        }
        
        static func imageTitleSpacing(for size: DSButtonSize) -> CGFloat {
            switch size {
            case .small: return 4
            case .medium: return 6
            case .large: return 8
            }
        }
        
    }
    
}
