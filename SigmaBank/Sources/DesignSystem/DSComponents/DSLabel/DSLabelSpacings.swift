import UIKit

extension DSSpacings {
    
    struct Label {
        
        static func margin(for size: DSLabelSize) -> UIEdgeInsets {
            switch size {
            case .labelSmall: return .init(top: 2, left: 0, bottom: 1, right: 0)
            case .labelMedium: return .init(top: 4, left: 0, bottom: 2, right: 0)
            case .labelLarge: return .init(top: 6, left: 0, bottom: 3, right: 0)
            case .bodySmall: return .init(top: 8, left: 0, bottom: 4, right: 0)
            case .bodyMedium: return .init(top: 10, left: 0, bottom: 5, right: 0)
            case .bodyLarge: return .init(top: 12, left: 0, bottom: 6, right: 0)
            case .headerSmall: return .init(top: 14, left: 0, bottom: 7, right: 0)
            case .headerMedium: return .init(top: 16, left: 0, bottom: 8, right: 0)
            case .headerLarge: return .init(top: 18, left: 0, bottom: 9, right: 0)
            }
        }
        
    }
    
}
