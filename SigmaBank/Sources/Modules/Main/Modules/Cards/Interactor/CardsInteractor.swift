public class CardsInteractor: @preconcurrency CardsInteractorInputProtocol {
    
    weak var output: CardsInteractorOutputProtocol?
    
    private let accountsService: AccountServiceProtocol
    
    init(accountsService: AccountServiceProtocol) {
        self.accountsService = accountsService
    }

    @MainActor
    func loadAcounts() {
        Task { [weak self] in

            let accounts = try await self?.accountsService.getAccounts() ?? []
            
            self?.output?.accountsLoaded(accounts: accounts)
        }
    }

}
