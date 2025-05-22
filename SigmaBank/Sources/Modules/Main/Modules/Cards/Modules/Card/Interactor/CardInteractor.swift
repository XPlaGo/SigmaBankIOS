public class CardInteractor: @preconcurrency CardInteractorInputProtocol {

    weak var output: CardInteractorOutputProtocol?
    
    private let accountsService: AccountServiceProtocol
    
    init(accountsService: AccountServiceProtocol) {
        self.accountsService = accountsService
    }

    @MainActor
    func loadPrivateData(for card: Card) {
        Task { [weak self] in
            self?.output?.cardPrivateDataLoading(true)

            let cardPrivateData = try await self?.accountsService.getCardPrivateData(for: card.cardId)
            
            switch cardPrivateData {
            case .some(let privateData):
                self?.output?.cardPrivateDataLoading(false)
                self?.output?.cardPrivateDataLoaded(privateData: privateData)
            case .none:
                self?.output?.cardPrivateDataLoading(false)
                print("Error")
            }
        }
    }
    
    func hidePrivateData() {
        self.output?.cardPrivateDataHided()
    }
}
