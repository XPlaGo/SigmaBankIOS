class Transaction {

    let transactionId: TransactionId

    let amount: Double

    private init(transactionId: TransactionId, amount: Double) {
        self.transactionId = transactionId
        self.amount = amount
    }

    class IncomeTransaction: Transaction {

        let fromCardNumber: CardNumber

        let payee: Payee

        init(transactionId: TransactionId, amount: Double, fromCardNumber: CardNumber, payee: Payee) {
            self.fromCardNumber = fromCardNumber
            self.payee = payee

            super.init(transactionId: transactionId, amount: amount)
        }

    }

    class OutcomeTransaction: Transaction {

        let toCardNumber: CardNumber

        let sender: Payee

        init(transactionId: TransactionId, amount: Double, toCardNumber: CardNumber, sender: Payee) {
            self.toCardNumber = toCardNumber
            self.sender = sender

            super.init(transactionId: transactionId, amount: amount)
        }

    }

}
