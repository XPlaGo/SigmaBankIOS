protocol TransferViewProtocol: AnyObject {

    func show(payee: [Payee])

}

protocol TransferPresenterProtocol: AnyObject {

    func viewDidLoad(view: TransferViewProtocol)

    func presentTransferByPhoneNumberModule(for: Payee)

    func presentTransferByCardNumberModule(for: Payee)

}

protocol TransferInteractorInputProtocol: AnyObject {

    func loadPayeesFromContacts()

    func loadPayeeBy(phoneNumber: PhoneNumber)

    func loadPayeeBy(cardNumber: CardNumber)

}

protocol TransferInteractorOutputProtocol: AnyObject {

    func loadPayeesFromContactsSuccess(payees: [Payee])

    func loadPayeesFromContactsFailure(error: Error)

    func loadPayeeByPhoneNumberSuccess(payee: Payee)

    func loadPayeeByPhoneNumberError(error: Error)

    func loadPayeeByCardNumberSuccess(payee: Payee)

    func loadPayeeByCardNumberFailure(error: Error)

}

protocol TransferRouterProtocol: AnyObject {

    func goToTransferToPayeeModule(with: Payee)

}
