import Foundation

class AuthenticationManager: AuthenticationManagerProtocol {

    private var currentContext: AuthenticationContext? = AuthenticationContext(token: .authorizedToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwiZ2l2ZW5fbmFtZSI6Ik5pa2l0YSIsImZhbWlseV9uYW1lIjoiWmFndXRhIiwicm9sZSI6IkF1dGhvcml6ZWQiLCJuYmYiOjE3NDc2NDA5MzIsImV4cCI6MTc0NzY3MDkzMiwiaWF0IjoxNzQ3NjQwOTMyLCJpc3MiOiJodHRwczovL3NpZ21hLWJhbmsucnUiLCJhdWQiOiJodHRwczovL3NpZ21hLWJhbmsucnUifQ.yncoAlXZmPRyXcaWH97WQb_iJByJHEJYYxTu2CvXvRQ"))
    
    // private var currentContext: AuthenticationContext?

    func getCurrentContext() async -> AuthenticationContext? {
        return currentContext
    }
    
    func setCurrentContext(_ context: AuthenticationContext?) async {
        currentContext = context
    }

}
