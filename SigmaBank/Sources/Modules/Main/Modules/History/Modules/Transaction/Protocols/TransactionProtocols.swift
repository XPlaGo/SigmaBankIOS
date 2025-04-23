protocol TransactionViewProtocol: AnyObject {

    func show(transaction: Transaction)

}

protocol TransactionPresenterProtocol: AnyObject {

    func viewDidLoad(view: TransactionViewProtocol)

}

protocol TransactionInteractorInputProtocol: AnyObject {

}

protocol TransactionInteractorOutputProtocol: AnyObject {

}

protocol TransactionRouterProtocol: AnyObject {

}
