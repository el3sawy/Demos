import Foundation
// Example for factory method and abstract 
protocol BankProtocol {
    var cardNumber: String {get}
    func deposit(value: Int)
    func withdraw(value: Int)
}

class CIB: BankProtocol {
    var cardNumber: String
    init(cardNumber: String) {
        self.cardNumber = cardNumber
    }
    
    func deposit(value: Int) {
        print("CIB deposit\(value)")
    }
    
    func withdraw(value: Int) {
        print("CIB withdraw \(value)")
    }
}

class HSBC: BankProtocol {
    var cardNumber: String
    init(cardNumber: String) {
        self.cardNumber = cardNumber
    }
    
    func deposit(value: Int) {
        print("HSBC deposit\(value)")
    }
    
    func withdraw(value: Int) {
        print("HSBC withdraw \(value)")
    }
}


// Add abstract factory
protocol PaymentProtocol: BankProtocol {}

class Visa: PaymentProtocol {
    var cardNumber: String
    init(cardNumber: String) {
        self.cardNumber = cardNumber
    }
    
    func deposit(value: Int) {
        print("Visa deposit\(value)")
    }
    
    func withdraw(value: Int) {
        print("Visa withdraw \(value)")
    }
}

class MasterCard: PaymentProtocol {
    var cardNumber: String
    init(cardNumber: String) {
        self.cardNumber = cardNumber
    }
    
    func deposit(value: Int) {
        print("MasterCard deposit\(value)")
    }
    
    func withdraw(value: Int) {
        print("MasterCard withdraw \(value)")
    }
}

protocol BankFactoryProtocol {
    var cardNumber: String {get}
    func getBank() -> BankProtocol
    func getPayment() -> PaymentProtocol
}

class BankFactory: BankFactoryProtocol {
    var cardNumber: String
    
    init(cardNumber: String) {
        self.cardNumber = cardNumber
    }
    
    func getBank() -> BankProtocol {
        switch cardNumber {
        case "1111": return CIB(cardNumber: cardNumber)
        case "2222": return HSBC(cardNumber: cardNumber)
        default:
            return CIB(cardNumber: cardNumber)
        }
    }
    
    func getPayment() -> PaymentProtocol {
        switch cardNumber {
        case "1111": return Visa(cardNumber: cardNumber)
        case "2222": return MasterCard(cardNumber: cardNumber)
        default:
            return Visa(cardNumber: cardNumber)
        }
    }
}

// how to use this
let factory = BankFactory(cardNumber: "2222")
let bank: BankProtocol = factory.getBank()
bank.deposit(value: 1000)
bank.withdraw(value: 500)
print("=====Payment ========")
let payment: PaymentProtocol = factory.getPayment()
payment.deposit(value: 1000)
payment.withdraw(value: 500)


