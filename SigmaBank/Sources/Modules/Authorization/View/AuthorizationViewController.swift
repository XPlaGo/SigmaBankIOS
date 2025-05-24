import UIKit
import SVProgressHUD

class AuthorizationViewController: UIViewController {
    
    private let presenter: AuthorizationPresenterProtocol
    
    init(presenter: AuthorizationPresenterProtocol) {
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

extension AuthorizationViewController: AuthorizationViewProtocol {

    func show() {
        self.view.backgroundColor = .systemBackground
    }
    
    func showLoading() {
        SVProgressHUD.show(withStatus: "Authenticating")
        SVProgressHUD.setBackgroundColor(DSColors.secondary)
        SVProgressHUD.setForegroundColor(DSColors.secondaryText)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }

}
