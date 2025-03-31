protocol TransferClientProtocol {

    func transferByPhoneNumber(from cardNumber: CardNumber, to payeePhoneNumber: PhoneNumber, amount: Double, token: AuthenticationToken) async throws -> Transaction
    
    func transferByCardNumber(from cardNumber: Card, to payeeCardNumber: CardNumber, amount: Double, token: AuthenticationToken) async throws -> Transaction

}
