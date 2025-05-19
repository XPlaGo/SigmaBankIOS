import UIKit

class PhoneNumberBuilder: PhoneNumberBuilderProtocol {
    
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationService: AuthenticationServiceProtocol, accountService: AccountServiceProtocol) {
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func build() -> UIViewController {
        let router = PhoneNumberRouter(authenticationService: authenticationService, accountService: accountService)
        let interactor = PhoneNumberInteractor(authenticationService: authenticationService)
        let presenter = PhoneNumberPresenter(router: router, interactor: interactor)
        let view = PhoneNumberViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
