import Foundation

class BDInteractor: BDInteractorInputProtocol {

    weak var output: BDInteractorOutputProtocol?
    
    private let dbService: BDServiceProtocol
    
    init(dbService: BDServiceProtocol) {
        self.dbService = dbService
    }

    @MainActor
    func loadScreen(by path: String) {
        Task { [weak self] in
            guard let self else { return }

            self.output?.loadingScreen()

            if let view = try await self.dbService.loadScreen(by: path) {
                self.output?.screenLoadedSuccess(content: view)
            } else {
                self.output?.screenLoadedError()
            }
        }
    }

}
