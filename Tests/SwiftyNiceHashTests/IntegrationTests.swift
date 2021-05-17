import XCTest
@testable import SwiftyNiceHash

final class SwiftyNiceHashTests: XCTestCase {
    
    var sut: NiceHashConnection!
    
    override func setUp() {
        sut = NiceHashConnection(apiKey: TestDetails.apiKey,
                                 apiSecret: TestDetails.apiSecret,
                                 organizationId: TestDetails.organizationId)
    }
    
    func testGetRigsAndStatuses() {
        let expectation = self.expectation(description: #function)
        
        sut.getRigsAndStatuses { result in
            switch result {
            case .success:
                expectation.fulfill()
                
            case .failure:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testGetHashpowerEarnings() {
        let expectation = self.expectation(description: #function)
        
        sut.getHashpowerEarnings(currency: "BTC") { result in
            switch result {
            case .success:
                expectation.fulfill()
                
            case .failure:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 10)
    }

    static var allTests = [
        ("testGetRigsAndStatuses", testGetRigsAndStatuses),
        ("testGetHashpowerEarnings", testGetHashpowerEarnings),
    ]
}
