import UIKit

extension DSSpacings {
    
    struct Input {
        
        static func padding(for size: DSInputSize) -> UIEdgeInsets {
            switch size {
            case .small: return .init(top: 8, left: 8, bottom: 8, right: 8)
            case .medium: return .init(top: 12, left: 12, bottom: 12, right: 12)
            case .large: return .init(top: 16, left: 16, bottom: 16, right: 16)
            }
        }
        
    }
    
}
