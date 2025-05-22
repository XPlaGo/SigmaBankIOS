protocol PayeeServiceProtocol {

    func getPayeesBy(
        phoneNumberSubstring: String,
        pagination: PaginationModel) async throws -> GetPayeesbyPhoneNumberClientResult

    func getPayeeBy(cardNumber: CardNumber) async throws -> Payee

}
