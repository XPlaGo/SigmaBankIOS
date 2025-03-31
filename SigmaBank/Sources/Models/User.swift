struct UserId: Equatable, Hashable {

    let value: String

    init(_ value: String) {
        self.value = value
    }

}

struct PhoneNumber: Equatable, Hashable {

    let value: String

    init(_ value: String) {
        self.value = value
    }

}

class User {

    let id: UserId
    
    let phoneNumber: PhoneNumber

    let firstName: String

    let lastName: String

    let age: Int
    
    init(id: UserId, phoneNumber: PhoneNumber, firstName: String, lastName: String, age: Int) {
        self.id = id
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }

}
