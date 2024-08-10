//
//  MoyaManager.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//

import Moya
import Alamofire

final class NetworkProvider<Target> where Target: Moya.TargetType {
    let provider: MoyaProvider<Target>
    
    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {
        
        self.provider = MoyaProvider(endpointClosure: endpointClosure,
                                     requestClosure: requestClosure,
                                     stubClosure: stubClosure,
                                     session: Session.default,
                                     plugins: plugins,
                                     trackInflights: trackInflights)
    }
    
    func cancel() {
        provider.session.cancelAllRequests()
    }
}

final public class MoyaManager: NetworkProtocol {
    
    private var cancelCallback: (() -> Void)?
    
    public init() { }
    
    public func send<T: Codable, U: Endpoint>(_ endpoint: U, expectedType: T.Type, _ onResponse: @escaping (Result<T, Error>) -> Void) {
        let provider = NetworkProvider<U>()
        cancelCallback = {
            provider.cancel()
        }
        provider.provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let model = try response.map(expectedType, using: decoder)
                    onResponse(.success(model))
                } catch {
                    self.report(error)
                    onResponse(.failure(error))
                }
            case .failure(let error):
                self.handleExpireSession(error.response?.statusCode)
                onResponse(.failure(error))
            }
        }
    }
    
    private func report(_ error: Error) {
        // TODO: - add Logger
        
    }
    
    // TODO: - Refresh Session
    private func handleExpireSession(_ statusCode: Int?) {
        guard let statusCode = statusCode else { return }
        debugPrint(statusCode)
    }
    
    func removePreviousCall() {
        cancelCallback?()
    }
}
