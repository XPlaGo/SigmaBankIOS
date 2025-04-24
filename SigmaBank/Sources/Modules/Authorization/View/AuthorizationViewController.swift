import UIKit

class AuthorizationViewController: UIViewController {
    
    private let presenter: AuthorizationPresenterProtocol
    
    private lazy var indicator: UIActivityIndicatorView = {
        var view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
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

        self.view.addSubview(indicator)
        
        indicator.startAnimating()
        indicator.center = view.center
    }

}
