import Foundation

class PhoneNumberPresenter: PhoneNumberPresenterProtocol {

    private weak var view: PhoneNumberViewProtocol?

    private let router: PhoneNumberRouterProtocol

    private let interactor: PhoneNumberInteractorInputProtocol

    init(router: PhoneNumberRouterProtocol,
         interactor: PhoneNumberInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad(view: any PhoneNumberViewProtocol) {
        self.view = view
        view.show()
    }

    func presentContinue(for phoneNumber: PhoneNumber) {
        self.interactor.check(phoneNumber: phoneNumber)
    }

}

extension PhoneNumberPresenter: PhoneNumberInteractorOutputProtocol {

    func checkSuccess(with phoneNumber: PhoneNumber) {
        self.view?.setValidationError(error: nil)
        self.interactor.sendConfirmationCode(to: phoneNumber)
    }

    func checkError(error: PhoneNumberValidationError) {
        self.view?.setValidationError(error: PhoneNumberValidationError(message: "Invalid phone number"))
    }

    func sendConfirmationCodeLoading() {
        self.view?.setLoading(true)
    }

    func sendConfirmationCodeSuccess(with phoneNumber: PhoneNumber) {
        self.view?.setLoading(false)
        self.router.goToConfirmationCodeModule(with: phoneNumber)
    }

    func sendConfirmationCodeError(error: PhoneNumberValidationError) {
        self.view?.setLoading(false)
        self.view?.setValidationError(error: error)
    }


}
