//
//  ViewController.swift
//  RxExample
//
//  Created by Steve Dao on 12/03/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class ViewController: UIViewController {
    
    @IBOutlet private var sw: UISwitch!
    @IBOutlet private var btn: UIButton!
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var activity: UIActivityIndicatorView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "OnSubscribed\n"
//        binding()
        action()
        
    }
    
    
    func action() {
        // 1
        let fetchAction = Action<Bool, Int>.init { isError in
                    if isError {
                        return .error(NSError.init(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Network error"]))
                    } else {
                        return .just(Int.random(in: 0...999))
                    }
                }

        // 2
        fetchAction.elements
            .subscribe(onNext: { [weak self] number in
                self?.textView.text += "OnNext: \(number)\n"
            }, onError: { [weak self] error in
                self?.textView.text += "OnError: \(error.localizedDescription)\n"
            }, onCompleted: { [weak self] in
                self?.textView.text += "OnCompleted\n"
            }, onDisposed: { [weak self] in
                self?.textView.text += "OnDisposed\n"
            })
        .disposed(by: disposeBag)

        // 3
        fetchAction.underlyingError
            .subscribe { error in
                self.show(error: error)
            }
            .disposed(by: disposeBag)

        // 4
        fetchAction.executing
            .subscribe { isLoading in
                self.showLoader(isLoading: isLoading)
            }
            .disposed(by: disposeBag)

        // 5
        btn.rx.bind(to: fetchAction) { _ in return self.sw.isOn }

    }
    
    func showLoader(isLoading: Bool) {
        if isLoading {
            self.activity.startAnimating()
        } else  {
            self.activity.stopAnimating()
        }
    }
   
    private func binding() {
        
        btn.rx
            .tap
            .flatMap { [weak self] _ -> Observable<Int> in
                guard let self = self else { return Observable.empty() }
                if self.sw.isOn {
                    return Observable<Int>.error(NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error from network"]))
                        .do(onError: {_ in self.show(error: "error")})
                        .catch({_ in return Observable.empty()})
                } else {
                    return self.fetchData()
                }
            }
            .subscribe(onNext: { [weak self] number in
                self?.textView.text += "OnNext: \(number)\n"
            }, onError: { [weak self] error in
                self?.textView.text += "OnError: \(error.localizedDescription)\n"
            }, onCompleted: { [weak self] in
                self?.textView.text += "OnCompleted\n"
            }, onDisposed: { [weak self] in
                self?.textView.text += "OnDisposed\n"
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchData() -> Observable<Int> {
       return Observable.just(Int.random(in: 0...999))
            .delay(.seconds(1), scheduler: MainScheduler.instance).do { [weak self] value in
                self?.activity.stopAnimating()
            } onError: { [weak self] _ in
                self?.activity.stopAnimating()
            } onCompleted: { [weak self] in
                self?.activity.stopAnimating()
            } onSubscribed: { [weak self] in
                self?.activity.startAnimating()
                print("Subscribe")
            } onDispose: { [weak self] in
                self?.activity.stopAnimating()
            }
    }
    
    private func show(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func show(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


class NMTextField: UITextField {
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) {
            return false
        }

        return true
    }
}
