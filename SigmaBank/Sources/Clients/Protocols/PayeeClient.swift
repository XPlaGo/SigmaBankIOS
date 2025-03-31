class GetPayeesbyPhoneNumberResult {
    
    let payees: [Payee]
    
    let pageToken: String

    init(payees: [Payee], pageToken: String) {
        self.payees = payees
        self.pageToken = pageToken
    }

}

protocol PayeeClientProtocol {

    func getPayeesByPhoneNumber(phoneNumberSubstring: String, pagination: PaginationModel, token: AuthenticationToken) async throws -> GetPayeesbyPhoneNumberResult
    
    func getPayeeByCardNumber(cardNumber: CardNumber, token: AuthenticationToken) async throws -> Payee
    
    func getPayeeById(id: PayeeId, token: AuthenticationToken) async throws -> Payee

}
