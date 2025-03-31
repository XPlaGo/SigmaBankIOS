struct PayeeId: Equatable, Hashable {

    let value: String

    init(_ value: String) {
        self.value = value
    }

}

class Payee {
    
    let id: PayeeId
    
    let firstName: String

    let lastName: String
    
    let phoneNumber: PhoneNumber

    let cardNumber: CardNumber
    
    init(id: PayeeId, firstName: String, lastName: String, phoneNumber: PhoneNumber, cardNumber: CardNumber) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.cardNumber = cardNumber
    }

}
