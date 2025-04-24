import UIKit

class ConfirmationCodeViewController: UIViewController {
    
    private let presenter: ConfirmationCodePresenterProtocol

    private var confirmationCode: String = ""

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 16
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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter confirmation code"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirmation Code"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .systemGray6
        textField.addTarget(
            self,
            action: #selector(onPhoneNumberFieldValueChanged(_:)),
            for: .editingChanged)
        return textField
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemRed
        label.textAlignment = .center
        return label
    }()

    private lazy var continueButton: UIButton = {
        var config = UIButton.Configuration.filled()

        config.image = UIImage(systemName: "checkmark")
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.buttonSize = .medium
        config.cornerStyle = .medium

        let button = UIButton(configuration: config)
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

        view.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])

        contentView.addSubview(stackView)

        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(horizontalStackView)
        stackView.addArrangedSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 128),
            logoImage.heightAnchor.constraint(equalToConstant: 128),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
        
        horizontalStackView.addArrangedSubview(phoneNumberField)
        horizontalStackView.addArrangedSubview(continueButton)

        NSLayoutConstraint.activate([
            horizontalStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 48),
            continueButton.widthAnchor.constraint(equalToConstant: 48),
        ])
    }

    func setConfirmError(error: ConfirmError?) {
        let text: String = switch error {
        case .some(_):
            "Invalid confirmation code"
        case .none:
            ""
        }
        self.errorLabel.text = text
    }

    func setLoading(_ loading: Bool) {
        self.continueButton.configuration?.showsActivityIndicator = loading
    }

    @objc private func continueButtonTapped() {
        presenter.confirm(code: self.confirmationCode)
    }
    
    @objc private func onPhoneNumberFieldValueChanged(_ textField: UITextField) {
        self.confirmationCode = textField.text ?? ""
    }
}
