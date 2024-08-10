import WOPDomain
import Foundation

struct TestResource: ResourceType {
    let method: HTTPMethod
    let path: String
    let parameters: [RequestParameter]
    let baseURLString: String
    let parseValue: String
    
    func baseURL(for environment: AppEnvironment) -> String {
        baseURLString
    }

    func parse(data: Data, response: HTTPURLResponse) throws -> String {
        return parseValue
    }
}

extension TestResource {
    static func stub(method: HTTPMethod = .get,
                     path: String = "test",
                     parameters: [RequestParameter] = [
                         RequestParameter(name: "param1", value: .query("value1")),
                         RequestParameter(name: "param2", value: .query("value2"))
                     ],
                     baseURLString: String = "https://payback.com",
                     parseValue: String = "ParsedValue") -> Self {
        return TestResource(method: method, path: path, parameters: parameters, baseURLString: baseURLString, parseValue: parseValue)
    }
}
