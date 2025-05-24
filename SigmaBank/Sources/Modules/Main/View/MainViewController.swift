import UIKit

class MainViewController: UIViewController {
    private let presenter: MainPresenterProtocol
    
    private lazy var tabBar: UITabBar = {
        let view = UITabBar()
        view.layer.backgroundColor = DSColors.background.cgColor
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self)
    }
}

extension MainViewController: MainViewProtocol {

    func show() {
        self.title = "Main"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.view.backgroundColor = .systemBackground

        setupTabBar()
        setupContainer()
    }
    
    private func setupTabBar() {
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        let cardsItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "creditcard.fill"), tag: 0);
        let transfersItem = UITabBarItem(title: "Transfers", image: UIImage(systemName: "arrow.left.arrow.right.square.fill"), tag: 1);
        let historyItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock.fill"), tag: 2)
        let moreItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle.fill"), tag: 3)
        
        tabBar.items = [cardsItem, transfersItem, historyItem, moreItem]
        tabBar.selectedItem = cardsItem
        
        if let initialItem = tabBar.items?[tabBar.selectedItem?.tag ?? 0] {
            self.tabBar(tabBar, didSelect: initialItem)
        }
        
        view.addSubview(tabBar)
        
        NSLayoutConstraint.activate([
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupContainer() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
        ])
    }

}

extension MainViewController: UITabBarDelegate {
    func switchTo(viewController: UIViewController) {
        children.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        
        addChild(viewController)
        viewController.view.frame = containerView.bounds
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            self.title = "Cards"
            switchTo(viewController: self.presenter.getCardsModule())
        case 1:
            self.title = "Transfers"
            switchTo(viewController: self.presenter.getTransfersModule())
        case 2:
            self.title = "History"
            switchTo(viewController: self.presenter.getHistoryModule())
        case 3:
            self.title = "More"
            switchTo(viewController: self.presenter.getMoreModule())
        default:
            break
        }
    }
}
