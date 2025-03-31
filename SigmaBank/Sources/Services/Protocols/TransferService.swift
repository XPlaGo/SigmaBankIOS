class TransferResult {

    let transaction: Transaction

    let payee: Payee
    
    init(transaction: Transaction, payee: Payee) {
        self.transaction = transaction
        self.payee = payee
    }

}

protocol TransferServiceProtocol {
    
    func transferByPhoneNumber(from cardNumber: CardNumber, to payeePhoneNumber: PhoneNumber, amount: Double) async throws -> TransferResult
    
    func transferByCardNumber(from cardNumber: CardNumber, to payeeCardNumber: CardNumber, amount: Double) async throws -> TransferResult

}
