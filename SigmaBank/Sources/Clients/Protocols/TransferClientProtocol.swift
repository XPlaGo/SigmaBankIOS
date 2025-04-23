protocol TransferClientProtocol {

    func transferBy(
        from cardNumber: CardNumber,
        to payeePhoneNumber: PhoneNumber,
        amount: Double,
        token: AuthenticationToken) async throws -> Transaction

    func transferBy(
        from cardNumber: Card,
        to payeeCardNumber: CardNumber,
        amount: Double,
        token: AuthenticationToken) async throws -> Transaction

}
