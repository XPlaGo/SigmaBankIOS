import UIKit

class PhoneNumberViewController: UIViewController {

    private let presenter: PhoneNumberPresenterProtocol

    private var phoneNumber: String = ""

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: DSStack = {
        let viewModel = DSStackViewModel(
            axis: .vertical,
            items: [logoImage, nameLabel, horizontalStackView, errorLabel],
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
            items: [phoneNumberField, continueButton],
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
        view.image = UIImage(named: "Icon")
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var nameLabel: DSLabel = {
        let viewModel = DSLabelViewModel(
            text: "Enter phone number",
            style: .content,
            size: .headerSmall,
            alignment: .center)
        let view = DSLabel()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var phoneNumberField: UITextField = {
        let viewModel = DSInputViewModel(
            style: .secondary,
            size: .medium,
            placeholder: "Your Phone Number",
            image: UIImage(systemName: "phone.fill"),
            isEnabled: true)
        let view = DSInput()
        view.configure(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(onPhoneNumberFieldValueChanged(_:)),
            for: .editingChanged)
        
        return view
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

    init(presenter: PhoneNumberPresenterProtocol) {
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

extension PhoneNumberViewController: PhoneNumberViewProtocol {

    func show() {
        view.backgroundColor = .systemBackground

        navigationItem.title = "Sign In"

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

    func setValidationError(error: PhoneNumberValidationError?) {
        errorLabel.text = error?.message ?? ""
    }

    func setLoading(_ loading: Bool) {
        self.continueButton.configuration?.showsActivityIndicator = loading
    }

    @objc private func continueButtonTapped() {
        presenter.presentContinue(for: PhoneNumber(value: phoneNumber))
    }

    @objc private func onPhoneNumberFieldValueChanged(_ textField: UITextField) {
        self.phoneNumber = textField.text ?? ""
    }

}
