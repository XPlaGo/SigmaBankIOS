import UIKit

extension DSSpacings {
    
    struct Card {
        
        static func padding(for size: DSCardSize) -> UIEdgeInsets {
            switch size {
            case .small: return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            case .medium: return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
            case .large: return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            }
        }
        
    }
    
}
