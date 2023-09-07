import Foundation
class Student {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Student: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Student(name: self.name, age: self.age)
    }
    
    func clone() -> Student {
       return self.copy() as! Student
    }
}
extension Student: CustomStringConvertible {
    var description: String {
        return "name = \(name), age = \(age)"
    }
}

let student1 = Student(name: "Ahmed", age: 28)
let student2 = student1.clone()

student2.name = "Ali"
print(student1)

// --------- Another solution ----------

protocol Copyable {
    init(instance: Self)
}

extension Copyable {
    func copy() -> Self {
        Self.init(instance: self)
    }
}

class Car: Copyable {

    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    required init(instance: Car) {
        self.color = instance.color
        self.name = instance.name
    }
}

let bmw = Car(name: "BMW", color: "Black")
let kia = bmw.copy()
kia.name = "Kia"

print(kia.name)
print(bmw.name)


// Copy on write

var name1 = "Ahmed"
var name2 = name1

withUnsafePointer(to: name1) { p in
    print(p)
}
withUnsafePointer(to: name2) { p in
    print(p)
}





