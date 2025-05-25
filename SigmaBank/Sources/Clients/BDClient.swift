import Foundation

class BDClient {
    
    private let config: ClientConfig
    
    init(config: ClientConfig) {
        self.config = config
    }
    
    func fetchScreenContent(by path: String) async throws -> BDViewModel? {
        let url = URL(string: "\(config.host):\(config.port)/\(path)")!

        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try? JSONDecoder().decode(BDViewModel.self, from: data)
    }
    
}
