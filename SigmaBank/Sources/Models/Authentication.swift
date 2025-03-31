enum AuthenticationToken {
    case VerificationToken(String)
    case ConfirmedToken(String)
    case RegistratedToken(String)
    case AuthorizatedToken(String)
}

class AuthenticationContext {

    var token: AuthenticationToken
    
    var user: User?
    
    init(token: AuthenticationToken, user: User? = nil) {
        self.token = token
        self.user = user
    }
    
}
