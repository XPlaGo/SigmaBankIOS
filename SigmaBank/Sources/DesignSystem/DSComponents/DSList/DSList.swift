import UIKit

class DSList: UIView {

    private var viewModel: DSListViewModel?

    private var items: [UIView] = []

    private var collectionView: UICollectionView

    override init(frame: CGRect) {
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
        setup()
    }

    private func setup() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        collectionView.backgroundColor = nil

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func configure(with viewModel: DSListViewModel) {
        self.viewModel = viewModel
        self.items = viewModel.items

        collectionView.register(DSListItem.self, forCellWithReuseIdentifier: viewModel.itemIdentifier)

        switch viewModel.style {
        case .ghost:
            backgroundColor = DSColors.background
        case .content:
            backgroundColor = DSColors.content
        }

        layoutMargins = DSSpacings.List.padding(for: viewModel.size)

        let layout = createLayout(viewModel: viewModel)
        collectionView.setCollectionViewLayout(layout, animated: false)

        collectionView.reloadData()
    }

    func register(_ cellClass: AnyClass?, forCellWithReusableIdentifier identifier: String) {
        collectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }

    private func createLayout(viewModel: DSListViewModel) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = viewModel.direction == .vertical ? .vertical : .horizontal
        layout.minimumLineSpacing = DSSpacings.List.itemsSpacing(for: viewModel.size)
        layout.minimumInteritemSpacing = DSSpacings.List.itemsSpacing(for: viewModel.size)

        switch viewModel.filling {
        case .fill:
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
        case .contents:
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }

        return layout
    }

    func setItems(_ items: [UIView]) {
        self.items = items
        self.collectionView.reloadData()
    }

}


extension DSList: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: viewModel?.itemIdentifier ?? DSListItem.reuseIdentifier,
            for: indexPath) as! DSListItem
        cell.innerView = items[indexPath.item]
        return cell
    }

}

extension DSList: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(
            withDuration: 0.3,
            delay: Double(indexPath.item) * 0.1,
            options: .curveEaseOut,
            animations: {
                cell.alpha = 1
                cell.transform = .identity
            },
            completion: nil)
    }

}

extension DSList: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width;
        let availableHeight = collectionView.bounds.height;

        switch viewModel?.filling {
        case nil:
            return UICollectionViewFlowLayout.automaticSize
        default:
            if viewModel?.itemLength == nil {
                return (collectionViewLayout as? UICollectionViewFlowLayout)!.itemSize
            }
            switch viewModel!.direction {
            case .vertical:
                return CGSize(width: availableWidth, height: viewModel?.itemLength ?? UICollectionViewFlowLayout.automaticSize.height)
            case .horizontal:
                return CGSize(width: viewModel?.itemLength ?? UICollectionViewFlowLayout.automaticSize.width, height: availableHeight)
            }
        }
    }
}
