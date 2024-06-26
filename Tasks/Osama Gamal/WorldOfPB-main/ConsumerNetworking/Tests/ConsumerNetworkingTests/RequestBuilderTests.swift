import XCTest
@testable import ConsumerNetworking
import WOPDomain

class RequestBuilderTests: XCTestCase {
    var requestBuilder: RequestBuilder!
    var testResource: TestResource!

    override func setUp() {
        super.setUp()
        requestBuilder = RequestBuilder(configurations: ConfigurationsProviderMock(),
                                        consumerId: "main")
        testResource = TestResource.stub()
    }

    override func tearDown() {
        requestBuilder = nil
        testResource = nil
        super.tearDown()
    }

    func testCreateURLRequest_WithValidResource_ReturnsURLRequest() async throws {
        let urlRequest = try requestBuilder.createURLRequest(for: testResource)
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://payback.com/test?param1=value1&param2=value2")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func testCreateURLRequest_WithInvalidBaseURL_ThrowsError() async {
        testResource = TestResource.stub(baseURLString: "https:// invalid_base_url@ @!")
        XCTAssertThrowsError(try requestBuilder.createURLRequest(for: testResource)) { error in
            XCTAssertEqual(error as? RequestBuildingError, .invalidBaseURL)
        }
    }

    func testCreateURLRequest_WithCustomParameters_ReturnsURLRequest() async throws {
        testResource = TestResource.stub(parameters: [
            RequestParameter(name: "customParam1", value: .query("customValue1")),
            RequestParameter(name: "customParam2", value: .query("customValue2"))
        ])

        let urlRequest = try requestBuilder.createURLRequest(for: testResource)
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://payback.com/test?customParam1=customValue1&customParam2=customValue2")
    }

    func testCreateURLRequest_WithPostMethod_ReturnsURLRequest() async throws {
        testResource = TestResource.stub(method: .post)

        let urlRequest = try requestBuilder.createURLRequest(for: testResource)
        XCTAssertEqual(urlRequest.httpMethod, "POST")
    }
    
    func testCreateURLRequest_Applies_Consumer_ID_To_Request_Headers() async throws {
        testResource = TestResource.stub()

        let urlRequest = try requestBuilder.createURLRequest(for: testResource)
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Consumer-ID"), "main")
    }
}
