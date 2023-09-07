//
//  PlayViewController.swift
//  CombineDemo
//
//  Created by Ahmed Elesawy on 19/01/2023.
//

import UIKit
import Combine

class PlayViewController: UIViewController {

    @IBOutlet weak var canView: CanvasView!
    var sub = AppBag()
    
    struct SomeModel: Decodable {}
    var cancellable: AnyCancellable?
    deinit {
      Swift.print("deinit subscriber")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
      let x =   (0...10).publisher
//            .subscribe(IntSubscriber())
        
        
//        canView.tapPublisher.sink { value in
//            print(value)
//        }.store(in: &sub)
        
//        (0...6).publisher.subscribe(IntSubscriber())
        
//        makeTheRequest1()
    }
    
    func makeTheRequest() {
      let request = URLRequest(url: URL(string: "https://www.donnywals.com")!)
      let publisher: URLSession.DecodedDataTaskPublisher<SomeModel> = URLSession.shared.decodedDataTaskPublisher(for: request)
      cancellable = publisher.sink(receiveCompletion: { completion in
        print("Received completion: \(completion)")
      }, receiveValue: { value in
        print("Received value: \(value)")
      })
    }
    
    func makeTheRequest1() {
      let request = URLRequest(url: URL(string: "https://www.donnywals.com")!)
      let publisher: URLSession.DecodedDataTaskPublisher<SomeModel> = URLSession.shared.decodedDataTaskPublisher(for: request)
      let subscriber = DecodableDataTaskSubscriber<SomeModel>()
      publisher.subscribe(subscriber)
    }
}

class CanvasView: UIView {
    var tapPublisher: AnyPublisher<CGPoint, Never> {
        tapSubject.eraseToAnyPublisher()
    }

    private let tapSubject = PassthroughSubject<CGPoint, Never>()

    @objc private func handle(_ recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: self)
        tapSubject.send(location)
    }
}
