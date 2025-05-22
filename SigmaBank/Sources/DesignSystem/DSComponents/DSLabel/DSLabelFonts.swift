import UIKit

extension DSFonts {
    
    static func labelFonts(for size: DSLabelSize) -> UIFont {
        switch size {
        case .labelSmall: return .systemFont(ofSize: 8, weight: .bold)
        case .labelMedium: return .systemFont(ofSize: 10, weight: .bold)
        case .labelLarge: return .systemFont(ofSize: 12, weight: .bold)
        case .bodySmall: return .systemFont(ofSize: 14, weight: .medium)
        case .bodyMedium: return .systemFont(ofSize: 16, weight: .medium)
        case .bodyLarge: return .systemFont(ofSize: 20, weight: .medium)
        case .headerSmall: return .systemFont(ofSize: 24, weight: .bold)
        case .headerMedium: return .systemFont(ofSize: 28, weight: .bold)
        case .headerLarge: return .systemFont(ofSize: 32, weight: .bold)
        }
    }
    
}
