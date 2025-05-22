import UIKit

extension DSFonts {

    static func buttonFont(for size: DSButtonSize) -> UIFont {
        switch size {
        case .small: return .systemFont(ofSize: 16, weight: .medium)
        case .medium: return .systemFont(ofSize: 16, weight: .medium)
        case .large: return .systemFont(ofSize: 16, weight: .medium)
        }
    }

}
