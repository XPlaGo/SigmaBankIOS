protocol AccountClientProtocol {

    func getAccounts(token: String) async throws -> [Account]

    func getCardPrivateData(for cardId: Int, token: String) async throws -> CardPrivateData

}
