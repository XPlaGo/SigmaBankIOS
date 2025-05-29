import Foundation

protocol BDClientProtocol {
    
    func fetchScreenContent(by path: String) async throws -> BDViewModel?
    
}
