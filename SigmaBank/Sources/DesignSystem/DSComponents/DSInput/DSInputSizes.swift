import UIKit

extension DSSizes {
    
    struct Input {
        
        static func borderRadius(for size: DSInputSize) -> CGFloat {
            switch size {
            case .small: return 8
            case .medium: return 14
            case .large: return 20
            }
        }
        
    }
    
}
