import UIKit

class BDService: BDServiceProtocol {
    
    private let client: BDClient
    
    private let mapper: BDMapper
    
    init(client: BDClient, mapper: BDMapper) {
        self.client = client
        self.mapper = mapper
    }
    
    @MainActor
    func loadScreen(by path: String) async throws -> UIView? {

        if let model = try? await client.fetchScreenContent(by: path) {
            let view = mapper.map(model: model)
            
            return view
        }
        
        return nil
    }
    
}
