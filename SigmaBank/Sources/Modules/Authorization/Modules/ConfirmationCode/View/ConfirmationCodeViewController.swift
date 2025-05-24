import UIKit

class ConfirmationCodeViewController: UIViewController {
    
    private let presenter: ConfirmationCodePresenterProtocol

    private var confirmationCode: String = ""

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [logoImage, confirmationLabel, horizontalStackView, errorCard],
            size: .large,
            alignment: .center)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var horizontalStackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .horizontal,
            items: [confirmationCodeField, continueButton],
            size: .small,
            distribution: .fill)
        let view = DSStack()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "staroflife.shield.fill")?
            .withTintColor(.label, renderingMode: .alwaysOriginal)
        return view
    }()
    
    private lazy var confirmationLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "Enter confirmation code",
            style: .content,
            size: .headerSmall,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var confirmationCodeField: UITextField = {
        let viewModel = DSInputViewModel(
            style: .secondary,
            size: .medium,
            placeholder: "Confirmation Code",
            image: UIImage(systemName: "key.fill"),
            isEnabled: true)
        let view = DSInput()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(onConfirmationCodeFieldValueChanged(_:)),
            for: .editingChanged)
        return view
    }()
    
    private lazy var errorCard: DSCard = {
        let viewModel = DSCardViewModel(
            content: errorLabel,
            style: .danger,
            size: .small,
            showShadow: false)
        let view = DSCard()
        view.configure(with: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var errorLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "",
            style: .danger,
            size: .bodyMedium,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var continueButton: UIButton = {
        let viewModel = DSButtonViewModel(
            style: .primary,
            image: UIImage(systemName: "arrow.right"),
        )
        let button = DSButton()
        button.configure(with: viewModel)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()

    init(presenter: ConfirmationCodePresenterProtocol) {
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

extension ConfirmationCodeViewController: ConfirmationCodeViewProtocol {

    func show() {
        view.backgroundColor = .systemBackground

        navigationItem.title = "Confirm"
        errorCard.isHidden = true

        view.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])

        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 128),
            logoImage.heightAnchor.constraint(equalToConstant: 128),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])

        NSLayoutConstraint.activate([
            horizontalStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 48),
            continueButton.widthAnchor.constraint(equalToConstant: 48),
        ])
    }

    func setConfirmError(error: ConfirmError?) {
        UIView.animate(withDuration: 0.1) {
            switch error {
            case .some(_):
                self.errorCard.isHidden = false
                self.errorLabel.setText("Invalid confirmation code")
            case .none:
                self.errorCard.isHidden = true
                self.errorLabel.setText("")
            }
        }
    }

    func setLoading(_ loading: Bool) {
        self.continueButton.configuration?.showsActivityIndicator = loading
    }

    @objc private func continueButtonTapped() {
        presenter.confirm(code: self.confirmationCode)
    }
    
    @objc private func onConfirmationCodeFieldValueChanged(_ textField: UITextField) {
        self.confirmationCode = textField.text ?? ""
    }
}
