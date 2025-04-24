import Foundation

class AuthenticationManager: AuthenticationManagerProtocol {

    private var currentContext: AuthenticationContext?

    func getCurrentContext() async -> AuthenticationContext? {
        await waitFor(nanos: 1_000_000_000)
        return currentContext
    }
    
    func setCurrentContext(_ context: AuthenticationContext?) async {
        await waitFor(nanos: 1_000_000_000)
        currentContext = context
    }
    
    private func waitFor(nanos: Int) async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {}
    }

}
