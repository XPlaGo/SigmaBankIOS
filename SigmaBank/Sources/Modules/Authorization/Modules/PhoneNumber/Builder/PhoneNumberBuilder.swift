import UIKit

class PhoneNumberBuilder: PhoneNumberBuilderProtocol {
    
    private let authenticationManager: AuthenticationManagerProtocol
    private let authenticationService: AuthenticationServiceProtocol
    private let accountService: AccountServiceProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol,
         authenticationService: AuthenticationServiceProtocol,
         accountService: AccountServiceProtocol) {
        self.authenticationManager = authenticationManager
        self.authenticationService = authenticationService
        self.accountService = accountService
    }

    func build() -> UIViewController {
        let router = PhoneNumberRouter(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService)
        let interactor = PhoneNumberInteractor(authenticationService: authenticationService)
        let presenter = PhoneNumberPresenter(router: router, interactor: interactor)
        let view = PhoneNumberViewController(presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }

}
