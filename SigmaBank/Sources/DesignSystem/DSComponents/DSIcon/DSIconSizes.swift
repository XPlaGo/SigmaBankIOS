import UIKit

extension DSSizes {
    
    struct Icon {
        
        static func size(for size: DSIconSize) -> CGFloat {
            switch size {
            case .small: return 24
            case .medium: return 32
            case .large: return 48
            }
        }
        
    }
}
