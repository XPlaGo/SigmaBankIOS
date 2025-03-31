protocol AuthenticationManagerProtocol {
    
    func setCurrentUser(_ user: User?)

    func currentUser() -> User?
    
    func setCurrentAuthorizationToken(_ token: String?)

    func currentAuthorizationToken() -> String?

}
