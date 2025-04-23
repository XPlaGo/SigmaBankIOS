protocol TransactionHistoryServiceProtocol {

    func getAllTransactionHistory(
        filter: GetAllTransactionHistoryFilterModel,
        pagination: PaginationModel) async throws -> GetAllTransactionHistoryClientResult

}
