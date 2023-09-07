import Foundation
import Combine
import PlaygroundSupport
import _Concurrency

PlaygroundPage.current.needsIndefiniteExecution = true

//let sub: AnyCancellable = Timer.publish(every: 1, on: .main, in: .common)
//    .autoconnect()
//    .sink { completion in
//        print(completion)
//    } receiveValue: { time in
//        print(time)
//    }
//
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//    sub.cancel()
//

//let arr = [1,2,3,4,4,4,5,6,7,8,8,8,8,9]
//
//var publsihed = PassthroughSubject<Int, Never>()
//for i in arr {
//    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
//        publsihed.send(i)
//    }
//}
//
//let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//var pub = arr.publisher
//
//let sub = pub.combineLatest(timer)
//    .sink { value, timer in
//        print(value)
//    }
//


//struct Student {
//    var name: String
//    var age: Double
//}
//
//
//class StudentViewModel {
//
//    var sub = PassthroughSubject<Student, Never>()
//    var candels = Set<AnyCancellable>()
//    var studentName: String = "" {
//        didSet {
//            print("Student ===>> ", studentName)
//        }
//    }
//
//    init() {
//
//        sub.map(\.name)
////        sub.map(mapper) // Retain cycle
////            .assign(to: \.studentName, on: self)
//            .sink(receiveValue: { [unowned self] value in
//                self.studentName = value
//            })
//            .store(in: &candels)
//    }
//
//
//    func mapper(_ std: Student) -> String {
//        return std.name
//    }
//
//    func getName() async -> String {
//        "Ahmed"
//    }
//    deinit {
//        print("deinit")
//    }
//}
//
//
//var viewModel: StudentViewModel? = StudentViewModel()
//viewModel?.sub.send(Student(name: "Ahmed", age: 10))
//
//viewModel = nil

//let publisher1 = Publishers.Sequence<[Int], Never>(sequence: [1,3,4,5])
//
//let subscriber = Subscribers.Sink<Int, Never> { completion in
//    print(completion)
//} receiveValue: {
//    print($0)
//}
//publisher1.receive(subscriber: subscriber)


// ============
//let passthroughSubject = PassthroughSubject<String, Never>()
//let anySubscriber = AnySubscriber(passthroughSubject)
//passthroughSubject.sink(
//     receiveCompletion: { completion in
//          print(completion)
//     }) { value in
//          print(value)
//     }
//[1, 2, 3, 4].publisher
//    .filter { $0.isMultiple(of: 2) }
//    .map { "My even number is \(String($0))" }
//    .receive(subscriber: anySubscriber)


