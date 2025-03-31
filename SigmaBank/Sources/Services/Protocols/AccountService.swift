protocol AccountServiceProtocol {

    func getAccounts() async throws -> [Acount]
    
    func getCardPrivateData(for cardNumber: CardNumber) async throws -> CardPrivateData

}
