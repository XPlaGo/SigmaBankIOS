class GetAllTransactionHistoryResult {
    
    let transactions: [Transaction]
    
    let pageToken: String
    
    init(transactions: [Transaction], pageToken: String) {
        self.transactions = transactions
        self.pageToken = pageToken
    }

}

protocol TransactionHistoryClient {
    
    func getAllTransactionHistory(filter: GetAllTransactionHistoryFilter, pagination: PaginationModel, token: AuthenticationToken) async throws -> GetAllTransactionHistoryResult

}
