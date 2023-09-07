//
//  HomeViewController.swift
//  ServiceLocatorDemo
//
//  Created by Ahmed Elesawy on 05/11/2022.
//

import UIKit
import NaturalLanguage // NLP

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        getLang()
       
    }
    
    
    func getLang() {
        let test = dic()
        var d: [String] = []
        let tagger = NLTagger(tagSchemes: [.language])
        test.forEach({ i in
            tagger.string = i.value
            let language = tagger.dominantLanguage?.rawValue ?? ""
            if language != "fr" {
                print(i.key, "====> ", language)
                print(i.value)
                print("===============\n")
                d.append(i.key)
            }
           
        })
        
        print(d.count, "count ")
    }
    
    
    func mapLang() {
        let dicEng = dic()
        let eng = read(file: "Eng")
        print(eng.count)
        let test = read(file: "Test")
        print(test.count)
        let uniqueValues = test.symmetricDifference(eng)
//        let uniqueValues = test.intersection(eng)
        
        print(uniqueValues.count)
        for i in uniqueValues {
            if let value = dicEng[i] {
                let key = i
                print(" \"\(key)\" = \"\(value)\";")
            }
           
        }
    }
    
    func read(file: String) ->  Set<String> {
        if let path = Bundle.main.path(forResource: file, ofType: "strings"),
            let dictionary = NSDictionary(contentsOfFile: path) {
            let keys = dictionary.allKeys as! [String]
            return Set(keys)
        }
        
        return Set([""])
    }
    
    
    
    func dic() -> [String: String] {
        if let path = Bundle.main.path(forResource: "Test", ofType: "strings"),
            let dictionary = NSDictionary(contentsOfFile: path) {
            let keys = dictionary as! [String: String]
           return keys
        }
        return [:]
    }
}
