import UIKit

extension DSSizes {
    
    struct Button {
        
        static func borderRadius(for size: DSButtonSize) -> CGFloat {
            switch size {
            case .small: return 8
            case .medium: return 14
            case .large: return 20
            }
        }
        
    }
    
}
