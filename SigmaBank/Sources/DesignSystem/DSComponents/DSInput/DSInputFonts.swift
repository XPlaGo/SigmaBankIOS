import UIKit

extension DSFonts {
    
    static func inputFont(for size: DSInputSize) -> UIFont {
        switch size {
        case .small: return .systemFont(ofSize: 16, weight: .medium)
        case .medium: return .systemFont(ofSize: 16, weight: .medium)
        case .large: return .systemFont(ofSize: 16, weight: .medium)
        }
    }
}
