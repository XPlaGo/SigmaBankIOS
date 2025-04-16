protocol TransferToPayeeViewProtocol: AnyObject {

    func show(payee: Payee, cards: [Card])

}

protocol TransferToPayeePresenterProtocol: AnyObject {

    func viewDidLoad(view: TransferToPayeeViewProtocol)

    func presentCompletedTransaction(transaction: Transaction, payee: Payee)

}

protocol TransferToPayeeInteractorInputProtocol: AnyObject {

    func transfer(payee: Payee, from: CardNumber, amount: Double)

    func loadCards()

}

protocol TransferToPayeeInteractorOutputProtocol: AnyObject {

    func transferSuccess(transaction: Transaction)

    func transferError(error: Error)

    func loadCardsSuccess(cards: [Card])

    func loadCardsFailure(error: Error)

}

protocol TransferToPayeeRouterProtocol: AnyObject {

}
