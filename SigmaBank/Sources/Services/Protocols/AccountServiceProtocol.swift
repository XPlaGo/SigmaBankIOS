protocol AccountServiceProtocol {

    func getAccounts() async throws -> [Account]

    func getCardPrivateData(for cardId: CardId) async throws -> CardPrivateData

}
