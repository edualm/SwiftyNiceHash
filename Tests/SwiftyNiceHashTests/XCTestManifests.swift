import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(IntegrationTests.allTests),
        testCase(RequestSignerTests.allTests),
    ]
}
#endif
