//
//  HomeViewController.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 21/08/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var txt: UITextField!
    
    @Published var userName: String?
    let subj = PassthroughSubject<Void, Never>()
    var cancels = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadWithFuture()
//        loadTods2()
//        loadTodos()
//        print("end")
//        let _url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

//        let model: AnyPublisher<[TodoModel], Error> = NetworkManager.request(_url)
//        let c  = NetworkManager.defaultPublisher()
        
        
//        testSchdular()
//        testZip()

        
    }
    
    
    func testSchdular() {
        let intSubject = PassthroughSubject<Int, Never>()

        intSubject.subscribe(on: ImmediateScheduler.shared)
            .sink {
                print($0)
                print(Thread.current)
            }.store(in: &cancels)


        intSubject.send(1)
        intSubject.send(2)
        intSubject.send(3)
    }
    @IBAction func btnTapped(_ sender: Any) {
        
        self.navigationController?.pushViewController(TestUIkitViewController(), animated: true)
//        notificationChecker()
//        subj.send()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.subj.send()
//          }
//          DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
//              self.subj.send()
//          }
    }
    
    func loadTods2() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        subj.map { _ in NetworkManager.request(url, type: [TodoModel].self) }
        .switchToLatest()   
        .sink { comp in
            print(comp)
        } receiveValue: { models in
            print(models.count)
        }.store(in: &cancels)

        
    }
    func loadTodos() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let publisher: AnyPublisher<[TodoModel], Error> =  NetworkManager.request(url)
            .share()
            .eraseToAnyPublisher()
        
        publisher.sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { (model: [TodoModel]) in
                print("model")
            }.store(in: &cancels)
        
        publisher.sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { (model: [TodoModel]) in
                print("model")
            }.store(in: &cancels)
        
        publisher.sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { (model: [TodoModel]) in
                print("model")
            }.store(in: &cancels)

    }
    
    func testZip() {
        let left = CurrentValueSubject<Int, Never>(0)
        let right = CurrentValueSubject<Int, Never>(0)
//        left.zip(right).sink(receiveValue: { value in
//            print(value)
//        }).store(in: &cancels)
//
        
//        left.zip(right).map { (l, r) -> String in
//            return "left \(l)  right \(r)"
//        }.sink {
//            print($0)
//        }.store(in: &cancels)
        
//        Publishers.MergeMan
//        left.merge(with: right).sink {
//            print($0)
//        }.store(in: &cancels)
        
        left.combineLatest(right).sink {
            print($0)
        }.store(in: &cancels)
        
        left.value = 1
        left.value = 2
        left.value = 3
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            right.value = 1
            right.value = 2
        left.value = 4
        }
        
    }
    
    func test() {
        txt.addTarget(self, action: #selector(textChanged), for: .editingChanged)
         $userName.throttle(for: 1, scheduler: DispatchQueue.main, latest: false)
//            .debounce(for: 0.3, scheduler: DispatchQueue.main)


            .print()
            .assign(to: \.text, on: lbl)
            .store(in: &cancels)
        
//         $userName.debounce(for: 1, scheduler: DispatchQueue.main)
//
//            .print()
//            .assign(to: \.text, on: lbl2)
//            .store(in: &cancels)
        
    }
    
    @objc func textChanged() {
        userName = txt.text
    }
    
    func loadWithFuture() {
        let _url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let pub: Future<[TodoModel], Error> = NetworkManager.requestFuture(_url)
        
//        pub.sink { complition in
//            print(complition)
//        } receiveValue: { models in
//            print("models")
//        }.store(in: &cancels)
//
//        pub.sink { complition in
//            print(complition)
//        } receiveValue: { models in
//            print("models")
//        }.store(in: &cancels)

    }
    
    
    func notificationChecker() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .denied:
                print("denied")
                self.present(UIViewController(), animated: true, completion: nil)
            case .notDetermined:
                print("notDetermined")
                DispatchQueue.main.async {
                self.present(UIViewController(), animated: true, completion: nil)
                }
            default:
                break
            }
        }
    }
    
}
