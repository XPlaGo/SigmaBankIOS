import UIKit

extension DSSizes {
    
    struct Card {
        
        static func borderRadius(for size: DSCardSize) -> CGFloat {
            switch size {
            case .small: return 8
            case .medium: return 14
            case .large: return 20
            }
        }
        
    }
    
}
