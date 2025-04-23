protocol TransactionHistoryClient {

    func getAllTransactionHistory(
        filter: GetAllTransactionHistoryClientFilterModel,
        pagination: PaginationModel,
        token: AuthenticationToken) async throws -> GetAllTransactionHistoryClientResult

}
