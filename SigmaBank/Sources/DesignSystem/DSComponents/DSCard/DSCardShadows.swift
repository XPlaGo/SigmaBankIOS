import UIKit

extension DSShadows {
    
    struct Card {
        
        static func shadow(for style: DSCardStyle) -> DSShadow {
            switch style {
            case .primary:
                return .init(
                    color: UIColor(red: 0.5, green: 0.7, blue: 1, alpha: 1).cgColor,
                    offset: CGSize(width: 0, height: 10),
                    radius: 20,
                    opacity: 1
                )
            case .secondary:
                return .init(
                    color: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                    offset: CGSize(width: 0, height: 0),
                    radius: 0,
                    opacity: 0
                )
            case .danger:
                return .init(
                    color: UIColor(red: 0.925, green: 0.945, blue: 0.968, alpha: 1).cgColor,
                    offset: CGSize(width: 0, height: 10),
                    radius: 20,
                    opacity: 1
                )
            case .ghost:
                return .init(
                    color: UIColor(red: 0.925, green: 0.945, blue: 0.968, alpha: 1).cgColor,
                    offset: CGSize(width: 0, height: 10),
                    radius: 20,
                    opacity: 1
                )
            case .content:
                return .init(
                    color: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
                    offset: CGSize(width: 0, height: 0),
                    radius: 0,
                    opacity: 0
                )
            }
        }
        
    }
    
}
