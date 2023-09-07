import Foundation
import UIKit
import Combine
import PlaygroundSupport
//
PlaygroundPage.current.needsIndefiniteExecution = true
//
//var cancellables = Set<AnyCancellable>()
//
//let myURL = URL(string: "https://practicalcombine.com")!
//
//func fetchURL(_ url: URL) -> Future<(data: Data, response: URLResponse), URLError> {
//    return Future { promise in
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error as? URLError {
//                  promise(.failure(error))
//            }
//
//            if let data = data, let response = response { promise(.success((data: data, response: response)))
//
//            }
//            print("RECEIVED RESPONSE")
//        }.resume()
//
//    }
//}
//
////let publisher = fetchURL(myURL)
//
////fetchURL(myURL)
//// .sink(receiveCompletion: { completion in
////
////    print(completion)
////  }, receiveValue: { value in
////    print(value.data)
////  }).store(in: &cancellables)
////
////fetchURL(myURL).sink { complition in
////    print(complition)
////} receiveValue: { value in
////    print(value.data)
////}.store(in: &cancellables)
////
//
//func createFuture() -> Future<Int, Never> {
//
//    return Future { promise in
//        print("Future")
//        promise(.success(Int.random(in: 1...100)))
//    }
//}
//
//
//
//func createDeferredFuture() -> AnyPublisher<Int, Never> {
//    return Deferred {
//        return Future { promise in
//            print("Deferred")
//            promise(.success(Int.random(in: 1...100)))
//        } }.eraseToAnyPublisher()
//}
//
//func defaultPublisher() -> AnyPublisher<Int, Never> {
//    let value = Int.random(in: 0...100)
//    print("defaultPublisher")
//    return [value].publisher.eraseToAnyPublisher()
//}
//
////let fut = createFuture()
////fut.sink {
////    print($0)
////}.store(in: &cancellables)
////
////fut.sink {
////    print($0)
////}.store(in: &cancellables)
////
////
////let def = createDeferredFuture()
////def.sink {
////    print($0)
////}.store(in: &cancellables)
////
////def.sink {
////    print($0)
////}.store(in: &cancellables)
////
////let defaultPub = defaultPublisher().share().eraseToAnyPublisher()
////defaultPub.sink {
////    print($0)
////}.store(in: &cancellables)
////
////defaultPub.sink {
////    print($0)
////}.store(in: &cancellables)
////
////defaultPub.sink {
////    print($0)
////}.store(in: &cancellables)

//let dic = ["A": 1, "B": 2]
//if let theJSONData = try? JSONSerialization.data(
//    withJSONObject: dic,
//    options: []) {
//    let theJSONText = String(data: theJSONData,
//                               encoding: .ascii)
//    print(theJSONText!)
//}

var cancels = Set<AnyCancellable>()

extension Publisher {
    func customSink(
        receiveCompletion: @escaping (Subscribers.Completion<Self.Failure>) -> Void,
        receiveValue: @escaping (Self.Output) -> Void) -> AnyCancellable {
        
            let sink = Subscribers.Sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
            self.subscribe(sink)
            return AnyCancellable(sink)
    }
}

let pub = [1,2,3,4].publisher

let sub = PassthroughSubject<Int, Never>()
sub.sink {
    print($0)
}.store(in: &cancels)

pub.subscribe(sub)
