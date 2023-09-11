//
//  PublishersViewController.swift
//  PlayWithCombine
//
//  Created by NTG on 11/09/2023.
//

import UIKit
import Combine

class PublishersViewController: UIViewController {

    let students = ["Ahmed", "KOKO", "Naguib", nil].publisher
    let degrees = [10, 20, 33, 88, nil].publisher
    
    var cancels = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mergeDemo()
    }
    
    
    func mergeDemo() {
        students
            .zip(degrees)
//            .filter({ $0 != nil && $1 != nil })
        //
            .filter({ self.validation(std: $0, degree: $1) })
            .sink { student, degree in
                print(student ?? "", "===", degree ?? 0)
            }
            .store(in: &cancels)
        
        
        
         
        students.sink { comple in
            switch comple {
                
            case .finished:
             print("fini")
            case .failure(let error):
                print(error)
            case .failure(let error as NSError):
                print(error)
            }
        } receiveValue: { str in
            
        }.store(in: &cancels)

        
    }
    
    func validation(std: String?, degree: Int?) -> Bool {
        std != nil && degree != nil
    }
}
