import UIKit

class MoreViewController: UIViewController {
    
    private let presenter: MorePresenterProtocol
    
    private lazy var spacer: DSSpacer = {
        return DSSpacer()
    }()
    
    private lazy var logoutButton: UIButton = {
        let viewModel = DSButtonViewModel(
            title: "Logout",
            size: .large,
            style: .danger,
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward.fill")
        )
        let button = DSButton()
        button.configure(with: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onLogoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [spacer, logoutButton],
            size: .medium)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(presenter: MorePresenterProtocol) {
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

extension MoreViewController {
    
    @objc
    func onLogoutButtonTapped() {
        presenter.logout()
    }
    
}

extension MoreViewController: MoreViewProtocol {

    func show() {
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

}
