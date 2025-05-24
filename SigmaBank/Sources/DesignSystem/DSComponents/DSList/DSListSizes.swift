import UIKit

extension DSSizes {
    
    struct List {
        
        static func borderRadius(for size: DSListSize) -> CGFloat {
            switch size {
            case .small: 8
            case .medium: 14
            case .large: 20
            }
        }
        
    }
    
}
