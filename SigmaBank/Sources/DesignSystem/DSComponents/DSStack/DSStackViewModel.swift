import UIKit

struct DSStackViewModel {
    let axis: DSStackAxis
    let items: [UIView]
    let size: DSStackSize
    let alignment: DSStackAlignment
    let distribution: DSStackDistribution
    let spacing: CGFloat?
    
    init(
        axis: DSStackAxis,
        items: [UIView],
        size: DSStackSize = .medium,
        alignment: DSStackAlignment = .fill,
        distribution: DSStackDistribution = .equalSpacing,
        spacing: CGFloat? = nil,
        padding: UIEdgeInsets? = nil) {
            self.axis = axis
            self.items = items
            self.size = size
            self.alignment = alignment
            self.distribution = distribution
            self.spacing = spacing
    }
}
