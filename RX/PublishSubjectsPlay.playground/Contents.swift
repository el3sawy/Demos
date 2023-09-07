import UIKit
import RxSwift
/*
 Not that
 subject is special kind of observable
 1- it can emit new items
 2- can subscribe as well like observable
 */


let disposeBag = DisposeBag()
let publishSubject = PublishSubject<String>()

publishSubject.onNext("Not added value")

publishSubject.subscribe { value in
    print(value)
}.disposed(by: disposeBag)

publishSubject.onNext("Item 1")
publishSubject.onNext("Item 2")
publishSubject.onNext("Item 3")
publishSubject.onNext("Item 4")

