protocol TransferServiceProtocol {

    func transferBy(
        payeePhoneNumber: PhoneNumber,
        from cardNumber: CardNumber,
        amount: Double) async throws -> TransferModel

    func transferBy(
        payeeCardNumber: CardNumber,
        from cardNumber: CardNumber,
        amount: Double) async throws -> TransferModel

}
