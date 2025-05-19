import Foundation

class AuthenticationManager: AuthenticationManagerProtocol {
    
    private let tokenKey = "token"
    private let tokenTimestampKey = "tokenTimestampKey"
    private let expInterval: TimeInterval = 30000
    
    private var currentContext: AuthenticationContext?
    
    init() {
        let defaults = UserDefaults.standard
        if let token = defaults.string(forKey: tokenKey) {
            self.currentContext = AuthenticationContext(token: .authorizedToken(token))
            if let tokenTimestamp = defaults.object(forKey: tokenTimestampKey) as? Date {
                if Date().timeIntervalSince(tokenTimestamp) > expInterval {
                    removeTokenData()
                }
            } else {
                removeTokenData()
            }
        }
    }

    func getCurrentContext() async -> AuthenticationContext? {
        return currentContext
    }
    
    func setCurrentContext(_ context: AuthenticationContext?) async {
        currentContext = context
        
        switch currentContext?.token {
        case .authorizedToken(let token):
            setTokenData(token)
        case nil:
            removeTokenData()
        default:
            break
        }
    }
    
    private func setTokenData(_ token: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: tokenKey)
        defaults.set(Date.now, forKey: tokenTimestampKey)
    }
    
    private func removeTokenData() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: tokenKey)
        defaults.removeObject(forKey: tokenTimestampKey)
    }

}
