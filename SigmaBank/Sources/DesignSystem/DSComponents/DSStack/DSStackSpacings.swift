import UIKit

extension DSSpacings {
    
    struct Stack {
        
        static func itemSpacing(for size: DSStackSize) -> CGFloat {
            switch size {
            case .small: return 8
            case .medium: return 12
            case .large: return 16
            }
        }
        
    }
    
}
