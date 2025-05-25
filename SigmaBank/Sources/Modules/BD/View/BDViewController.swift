import SVProgressHUD

import UIKit

class BDViewController: UIViewController {
    
    private let presenter: BDPresenterProtocol
    
    private let path: String
    
    init(title: String,path: String,presenter: BDPresenterProtocol) {
        self.path = path
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
        self.title = title
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didTapLoadScreen),
            name: .didTapLoadScreen,
            object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    var content: UIView? {
        didSet {
            show()
        }
    }
    
    @MainActor
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(view: self, by: path)
    }
    
}

extension BDViewController {
    
    @objc private func didTapLoadScreen(_ notification: Notification) {
        if let path = notification.userInfo?["path"] as? String,
           let title = notification.userInfo?["title"] as? String {
            presenter.goToScreen(title: title, by: path)
        }
    }
    
}

extension BDViewController: BDViewProtocol {
    
    func showLoading() {
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(DSColors.secondary)
        SVProgressHUD.setForegroundColor(DSColors.secondaryText)
    }
    
    func setContent(_ view: UIView) {
        self.content = view
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func show() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = DSColors.background

        guard content != nil else { return }
        
        view.addSubview(content!)
        
        content?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            content!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}

