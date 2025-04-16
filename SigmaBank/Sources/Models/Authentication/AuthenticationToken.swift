enum AuthenticationToken {
    case VerificationToken(String)
    case ConfirmedToken(String)
    case RegistratedToken(String)
    case AuthorizatedToken(String)
}
