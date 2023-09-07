// adapter pattern: make it fit for new use
// comments are not compatible with each other but have the same behaviour
// lets start coding

protocol PaymentProtocol {
    func receivedPayment(value: Double)
    var total: Double { get}
}

class ApplePayment: PaymentProtocol {
    var capital: Double = 100
    func receivedPayment(value: Double) {
        capital += value
    }
    
    var total: Double {
        print("Apple Payment\(capital)")
        return capital
    }
}

class MetaPayment: PaymentProtocol {
    var capital: Double = 200
    func receivedPayment(value: Double) {
        capital += value
    }
    
    var total: Double {
        print("Meta Payment\(capital)")
        return capital
    }
}

class GooglePayment {
    var capital: Double = 300
    var currency: String
    
    init(currency: String) {
        self.currency = currency
    }
    
    func paid(value: Double, currency: String) {
        if currency == "dollar" {
            capital += (value * 1.5)
        } else {
            capital += value
        }
    }
    
    var total: Double {
        print("Google Payment\(capital)")
        return capital
    }
}

extension GooglePayment: PaymentProtocol {
    func receivedPayment(value: Double) {
        paid(value: value, currency: currency)
    }
}

let apple = ApplePayment()
apple.receivedPayment(value: 100)

let google = GooglePayment(currency: "dollar")
google.receivedPayment(value: 100)

let meta = MetaPayment()
meta.receivedPayment(value: 100)

let payments: [PaymentProtocol] = [apple, google, meta]

payments.map({
    print($0.total)
})


