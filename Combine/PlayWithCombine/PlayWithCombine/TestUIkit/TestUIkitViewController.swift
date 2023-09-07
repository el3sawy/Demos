//
//  TestUIkitViewController.swift
//  PlayWithCombine
//
//  Created by Ahmed Elesawy on 18/09/2022.
//

import UIKit
import Combine
//https://github.com/DmitryLupich/Combine-UIKit/tree/master/CombineCustomPublishers

class TestUIkitViewController: UIViewController {
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var slider: UISlider!
    var cancels = Set<AnyCancellable>()
    
    @Published var name: String = ""
    
    
    deinit {
        print("Denit ")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = "ss"
        
//
//        bindSlider()
//        bindText()
        
        
        
        text.textPublisher.sink { [weak self] value in
            self?.name = value
        }.store(in: &cancels)
        text.textPublisher.assign(to: &$name)
        
        
        $name.sink { value in
            print(value)
        }.store(in: &cancels)
//
//        $name.sink {
//                   print("@Published  ", $0)
//               }.store(in: &cancels)
//            .assign(to: \.text , on: $name)
//            .assign(to: \., on: <#T##Root#>)
//            .assign(to: &$name)
//            .store(in: &cancels)
//        text.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
//        text.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
    }
    
//    func bindText() {
//        text.publisher(for: .editingChanged)
//            .sink { control in
//                guard let slider = control as? UITextField else { return }
////                print(slider.text )
//                self.name = slider.text
//            }.store(in: &cancels)
//    }
    func bindSlider() {
        slider.publisher(for: .valueChanged)
            .sink { control in
                guard let slider = control as? UISlider else { return }
                print(slider.value)
            }.store(in: &cancels)
    }
    
    func test() {
        let pub =  Publishers.Sequence<[Int], Never>(sequence: [1,2])
        let sub = Subscribers.Sink<Int, Never> { completion in
            print(completion)
        } receiveValue: { value in
            print(value)
        }
        
        pub.receive(subscriber: sub)
    }
}
