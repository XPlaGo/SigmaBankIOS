struct CardNumber: Equatable, Hashable {

    let value: String

    init(_ value: String) {
        self.value = value
    }

}

struct AccountId: Equatable, Hashable {

    let value: String

    init(_ value: String) {
        self.value = value
    }

}

enum CardType {
    case Mastercard
    case Visa
    case Mir
}

class Card {

    let cardNumber: CardNumber

    let cardType: CardType
    
    init(cardNumber: CardNumber, cardType: CardType) {
        self.cardNumber = cardNumber
        self.cardType = cardType
    }

}

class CardPrivateData {

    let cardExpirationDate: String

    let cardCode: String
    
    init(cardExpirationDate: String, cardCode: String) {
        self.cardExpirationDate = cardExpirationDate
        self.cardCode = cardCode
    }

}

class Account {
    
    let id: AccountId
    
    let cards: [Card]
    
    let amount: Double
    
    init(id: AccountId, cards: [Card], amount: Double) {
        self.id = id
        self.cards = cards
        self.amount = amount
    }
    
}
