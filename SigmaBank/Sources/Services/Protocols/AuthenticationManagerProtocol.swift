protocol AuthenticationManagerProtocol {

    func getCurrentContext() async -> AuthenticationContext?
    
    func setCurrentContext(_ context: AuthenticationContext?) async

}
