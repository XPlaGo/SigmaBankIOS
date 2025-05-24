import UIKit

extension DSSpacings {
    
    struct List {
        
        static func padding(for size: DSListSize) -> UIEdgeInsets {
            switch size {
            case .small: return .init(top: 8, left: 8, bottom: 8, right: 8)
            case .medium: return .init(top: 14, left: 14, bottom: 14, right: 14)
            case .large: return .init(top: 20, left: 20, bottom: 20, right: 20)
            }
        }
        
        static func itemsSpacing(for size: DSListSize) -> CGFloat {
            switch size {
            case .small: return 8
            case .medium: return 12
            case .large: return 16
            }
        }
        
    }
    
}
