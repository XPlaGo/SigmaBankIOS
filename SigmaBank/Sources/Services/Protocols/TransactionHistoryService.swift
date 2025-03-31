enum TransactionHistoryType {
    case Income
    case Outcome
}

class GetAllTransactionHistoryFilter {
    
    let type: TransactionHistoryType?
    
    let cardNumber: CardNumber?
    
    let payeeId: PayeeId?
    
    init(type: TransactionHistoryType? = nil, cardNumber: CardNumber? = nil, payeeId: PayeeId? = nil) {
        self.type = type
        self.cardNumber = cardNumber
        self.payeeId = payeeId
    }
    
}

protocol TransactionHistoryServiceProtocol {
    
    func getAllTransactionHistory(filter: GetAllTransactionHistoryFilter, pagination: PaginationModel) async throws -> GetAllTransactionHistoryResult
    
}
