enum ConfirmResult {
    case success
    case registrationRequeired
    case failed(error: ConfirmError)
}
