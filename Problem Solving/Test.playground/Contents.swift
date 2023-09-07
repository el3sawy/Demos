import Foundation

class Currency {
    var from: String = ""
    var value: Decimal = 0.0
    var to: String = ""
    var nameAll: String = ""
    init(from: String, value: Decimal, to: String, nameAll: String) {
        self.from = from
        self.value = value
        self.to = to
        self.nameAll = nameAll
    }
}

func splitCurrency(_ value: String) -> (from: String, to: String) {
    let from = String(value.prefix(3))
    let to = String(value.suffix(3))
    return (from, to)
}

func fillArray(arr: [String: Decimal]) -> [Currency] {
    var currency: [Currency] = []
    arr.forEach({ value in
        let names = splitCurrency(value.key)
        let item = Currency(from: names.from, value: value.value, to: names.to, nameAll: value.key)
        currency.append(item)
    })
    return currency
}

func find(pair: String, rates: [String: Decimal]) -> (rate: Decimal, route: String) {
    let currencyArray = fillArray(arr: rates)
    if let result = normalFind(pari: pair, arrCurrency: currencyArray) {
        return result
    } else {
        let names = splitCurrency(pair)
        let from = names.from
        let to = names.to
        search(arrCurrency: currencyArray, from: from, to: to)
        return (1.1, "")
    }
}
                
func search(arrCurrency: [Currency], from: String, to: String) {
    var queueName =  Queue<String>()
    var queueValues =  Queue<Decimal>()
    
    var dicNames: [Int: Queue<String>] = [:]
    var dicValues: [Int: Queue<Decimal>] = [:]
    
    print( arrCurrency.filter({$0.from == from}).count)
    guard let arrForAllTo = arrCurrency.filter({$0.from == from}).first else {return}
    print(arrForAllTo.to)
    queueName.push(arrForAllTo.to)
    queueValues.push(arrForAllTo.value)
    
    var toReqult = arrForAllTo.to
    for _ in 0...arrCurrency.count - 1 {
       let values = arrCurrency.filter({$0.from == toReqult})
        
        for i in 0...values.count - 1 {
            if values[i].to == to {
                print("foind   ",values[i].to)
                
            } else {
                print(values[i].to)
                toReqult  = values[i].to ?? ""
            }
        }
        print("========")
        
        
    }
}

func normalFind(pari: String, arrCurrency: [Currency]) -> (rate: Decimal, route: String)? {
    guard let item = arrCurrency.first(where: {$0.nameAll == pari}) else {return nil}
    return (item.value, item.to)
}

let r = find(pair: "NPRPHP", rates: ["MURBTN": 1.7129, "CUCTZS": 2309.4526, "MURTZS": 52.6165, "NPRMUR": 0.3649,
                                     "THBCUC": 0.0301,
                                     "BTNTHB": 0.4421,
                                     "TZSPHP": 0.0222,
                                    ])

//let r = find(pair: "USDRUB", rates: ["GBPRUB": 100, "USDGBP": 0.7, "GBPEUR": 0.83, "EURRUB": 86.3])
print(r.rate)
print(r.route)
//NPRMURTZSPHP




protocol QueueProtocol {
    associatedtype T
    mutating func push(_ item: T)
    mutating func pop() -> T?
    func peek() -> T?
    var count: Int {get}
    var isEmpty: Bool {get}
}

struct Queue<T>:  QueueProtocol {
    private var storage = [T]()
    mutating func push(_ item: T) {
        storage.append(item)
    }
    
    mutating func pop() -> T? {
        storage.removeFirst()
    }
    
    func peek() -> T? {
        storage.first
    }
    
    var count: Int {
        storage.count
    }
    
    var isEmpty: Bool {
        storage.isEmpty
    }
}


print("=============Dic =========")
let s = "{[()]}"

func tests() -> String {
    let count = s.count
    guard count % 2 == 0 else {return "NO"}
    
    let mid = count / 2
    let firtArr = Array(s.prefix(mid))
    var lastArr = Array(s.suffix(mid))
    var x = [1,2]
    x.sort()
    
    for i in 0..<mid   {
        let first = firtArr[i]
        let last = lastArr.popLast()
        if first == "{" {
            if last != "}" {
                return "NO"
            }
        } else if first == "[" {
            if last != "]" {
                return "NO"
            }
        } else if first == "(" {
            if last != ")" {
                return "NO"
            }
        }
    }
    
    return "YES"
}

print(tests())


