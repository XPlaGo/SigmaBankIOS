public class CardsInteractor: @preconcurrency CardsInteractorInputProtocol {
    
    weak var output: CardsInteractorOutputProtocol?
    
    private let accountsService: AccountServiceProtocol
    
    init(accountsService: AccountServiceProtocol) {
        self.accountsService = accountsService
    }

    @MainActor
    func loadAcounts() {
        Task { [weak self] in
            self?.output?.accountsLoaging()

            let accounts = try await self?.accountsService.getAccounts() ?? []
            
            self?.output?.accountsLoaded(accounts: accounts)
        }
    }

}
