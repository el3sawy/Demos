//
//  ImageLoaderViewController.swift
//  ModernConcurrency
//
//  Created by Ahmed Elesawy on 07/11/2022.
//

import UIKit
import Combine

@globalActor struct ss {
    static var shared = MyActor(title: "")
}
typealias AppBag = Set<AnyCancellable>

class ImageLoaderViewController: UIViewController {
    
    var age: Double?
    @IBOutlet weak var imageLoader: UIImageView!
   
    @IBOutlet weak var lbl: UILabel!
    let loader = DownloadImage()
    var appBag = AppBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await downloadByAsync()
        }
//        let s =  Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }

    
    func downloadByCombine() {
        loader.downloadByCombine()
        //            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] image in
                self?.imageLoader.image = image
            })
            .store(in: &appBag)
    }
    
    func downloadByAsync() async {
        let image = try? await loader.downloadAsync()
       await MainActor.run {  // we set await here to wait until switch to main thread
            imageLoader.image = image
        }
    }
    
    
    func downloadMayImages() async {
        do {
            async let fetchImage1 = loader.downloadAsync()
            async let fetchImage2 = loader.downloadAsync()
            async let fetchTitle = loader.getTitle()
            
            let (_, _, _) = await (try fetchImage1, try fetchImage2, fetchTitle)
        
            
        } catch {
            
        }
    }
    
    func testMyActor() {
        Task {
            let obje1 = MyActor(title: "Ahmed")
            let obje2 = obje1
            
            await print("obje1 = ", obje1.title)
            await print("obje2 = ", obje2.title)
            
//            obje1.title = "Naguib"
        }
    }
    
//    @TestActor func test2() {
//
//    }
}

actor MyActor {
    var title: String
//    var queu = DispatchQueue(label: "cxcxc.com")
    init(title: String) {
        self.title = title
    }
    
    func getTitle() -> String {
        
        // coe
        return "Ahmed"
    }
    
    func setTitle(_ name: String) {
        
            title = name
        
    }
    
    nonisolated func print(anme: String) {
        Swift.print("Ahmed ios")
    }
}



class Interactor {
    @Published var name: String = ""
    
    init() {
        Task {
            await getData()
        }
        
    }
    func getData() async {
        let obj = MyActor(title: "Ahmed")
        name = await obj.getTitle()
    }
}

class TestActor {
    
    
    func play()  {
//        Task {
        let obj = MyActor(title: "Ahmed")
//      let xx =  await obj.getTitle()
//        obj.title = "Ahmed"
        
        obj.print(anme: "")
        
//        await obj.setTitle("Ahmed")
        
//        }
    }
}




