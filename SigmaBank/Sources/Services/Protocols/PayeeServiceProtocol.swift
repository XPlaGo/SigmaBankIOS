protocol PayeeServiceProtocol {

    func getPayeesBy(
        phoneNumberSubstring: String,
        pagination: PaginationModel) async throws -> GetPayeesbyPhoneNumberResult

    func getPayeeBy(cardNumber: CardNumber) async throws -> Payee

}
