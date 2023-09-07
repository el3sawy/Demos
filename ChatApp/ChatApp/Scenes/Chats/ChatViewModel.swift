//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Ahmed Elesawy on 28/02/2023.
//

import Foundation
import Combine

class ChatViewModel {
    private let socket: WebSocketManagerProtocol
    
    init(socket: WebSocketManagerProtocol) {
        self.socket = socket
    }
    
    func send(with message: String) {
        socket.send(message: message)
    }
    
    
}


protocol WebSocketManagerProtocol {
    func send(message: String)
    var receiveSub: AnyPublisher<String, Never> { get }
}
class WebSocket2: WebSocketManagerProtocol {
    
    let webSocketDelegate = WebSocket()
    var webSocketTask: URLSessionWebSocketTask?
    private var receivePublisher = PassthroughSubject<String, Never>()
    
    var receiveSub: AnyPublisher<String, Never> {
        return receivePublisher.eraseToAnyPublisher()
    }
    init() {
        test()
    }
    func test() {
        
        let session = URLSession(configuration: .default, delegate: webSocketDelegate, delegateQueue: OperationQueue())
        let url = URL(string: "wss://echo.websocket.org")!
        //        let x = URLSession(configuration: .default)
        //        let r = x.webSocketTask(with: url)
        
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
    }
    
    func send(message: String) {
        webSocketTask?.send(.string(message), completionHandler: { _ in
            
        })
    }
    
    func reccive() {
        webSocketTask?.receive(completionHandler: { result in
            switch result {
                
            case .success(let data):
                
                switch data {
                    
                case .data(let data):
                    print(data)
                case .string(let message):
                    print("data")
                    self.receivePublisher.send(message)
                @unknown default:
                    print("data")
                }
            case .failure(_):
                print("")
            }
        })
    }
}

class WebSocket: NSObject, URLSessionWebSocketDelegate {
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Web Socket did connect")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Web Socket did disconnect")
    }
}
