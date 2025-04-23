enum Transaction {

    case income(
        transactionId: TransactionId,
        amount: Double,
        fromCardNumber: CardNumber,
        payee: Payee)

    case outcome(
        transactionId: TransactionId,
        amount: Double,
        toCardNumber: CardNumber,
        sender: Payee)

}
