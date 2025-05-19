import Foundation

class AuthenticationManager: AuthenticationManagerProtocol {
    
    private var currentContext: AuthenticationContext?

    func getCurrentContext() async -> AuthenticationContext? {
        return currentContext
    }
    
    func setCurrentContext(_ context: AuthenticationContext?) async {
        currentContext = context
    }

}
