import UIKit

protocol BDServiceProtocol {

    func loadScreen(by path: String) async throws -> UIView?

}
