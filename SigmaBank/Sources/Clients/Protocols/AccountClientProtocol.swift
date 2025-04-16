protocol AccountClient {

    func getAccounts(token: AuthenticationToken) async throws -> [Account]

    func getCardPrivateData(for cardId: String, token: AuthenticationToken) async throws -> CardPrivateData

}
