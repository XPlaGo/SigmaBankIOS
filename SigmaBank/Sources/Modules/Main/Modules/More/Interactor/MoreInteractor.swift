class MoreInteractor: @preconcurrency MoreInteractorInputProtocol {
    
    weak var output: MoreInteractorOutputProtocol?
    
    private let authenticaionService: AuthenticationServiceProtocol
    
    init(authenticaionService: AuthenticationServiceProtocol) {
        self.authenticaionService = authenticaionService
    }
    
    @MainActor
    func logout() {
        Task { [weak self] in
            try await self?.authenticaionService.logout()
            
            self?.output?.logoutDidFinish()
        }
    }

}
