protocol AccountServiceProtocol {

    func getAccounts() async throws -> [Account]

    func getCardPrivateData(for cardNumber: CardNumber) async throws -> CardPrivateData

}
