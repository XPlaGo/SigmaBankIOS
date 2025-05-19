protocol PayeeClientProtocol {

    func getPayeesBy(
        phoneNumberSubstring: String,
        pagination: PaginationModel,
        token: AuthenticationToken) async throws -> GetPayeesbyPhoneNumberClientResult

    func getPayeeBy(
        cardNumber: CardNumber,
        token: AuthenticationToken) async throws -> Payee

    func getPayeeBy(id: PayeeId, token: AuthenticationToken) async throws -> Payee

}
