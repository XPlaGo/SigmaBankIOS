protocol PayeeServiceProtocol {

    func getPayeesByPhoneNumber(phoneNumberSubstring: String, pagination: PaginationModel) async throws -> GetPayeesbyPhoneNumberResult
    
    func getPayeeByCardNumber(cardNumber: CardNumber) async throws -> Payee

}
