enum AuthenticationToken {
    case confirmationToken(String)
    case confirmedToken(String)
    case authorizedToken(String)
}
