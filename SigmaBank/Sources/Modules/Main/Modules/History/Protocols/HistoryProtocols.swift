protocol HistoryViewProtocol: AnyObject {

    func show(history: [Transaction])

}

protocol HistoryPresenterProtocol: AnyObject {

    func viewDidLoad(view: HistoryViewProtocol)

}

protocol HistoryInteractorInputProtocol: AnyObject {

    func loadHistory()

}

protocol HistoryInteractorOutputProtocol: AnyObject {

    func loadHistorySuccess(history: [Transaction])

    func loadHistoryFailure(error: Error)

}

protocol HistoryRouterProtocol: AnyObject {

    func goToTransactionModule(for transaction: Transaction)
}
