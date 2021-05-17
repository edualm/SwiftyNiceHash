import XCTest
@testable import SwiftyNiceHash

final class RequestSignerTests: XCTestCase {
    
    func testSign() {
        let sut = RequestSigner(apiKey: "4ebd366d-76f4-4400-a3b6-e51515d054d6",
                                apiSecret: "fd8a1652-728b-42fe-82b8-f623e56da8850750f5bf-ce66-4ca7-8b84-93651abc723b",
                                organizationId: "da41b3bc-3d0b-4226-b7ea-aee73f94a518")
        
        let actualSignature = sut.sign(method: .GET,
                                       path: "/main/api/v2/hashpower/orderBook",
                                       query: "algorithm=X16R&page=0&size=100",
                                       body: nil,
                                       time: 1543597115712,
                                       nonce: "9675d0f8-1325-484b-9594-c9d6d3268890")
        
        XCTAssertEqual(actualSignature, "21e6a16f6eb34ac476d59f969f548b47fffe3fea318d9c99e77fc710d2fed798")
    }

    static var allTests = [
        ("testSign", testSign),
    ]
}
