import UIKit

struct DSListViewModel {
    let direction: DSListDirection
    let items: [UIView]
    let size: DSListSize
    let style: DSListStyle
    let filling: DSListFilling
    let itemLength: CGFloat?
    let itemIdentifier: String
}
