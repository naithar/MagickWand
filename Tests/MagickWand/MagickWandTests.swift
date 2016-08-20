import XCTest
@testable import MagickWand

class MagickWandTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(MagickWand().text, "Hello, World!")
    }


    static var allTests : [(String, (MagickWandTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
