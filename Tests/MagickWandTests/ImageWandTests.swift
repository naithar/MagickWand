import Foundation
import XCTest
@testable import MagickWand

class ImageWandTests: XCTestCase {
    
    override func setUp() {
        MagickWand.genesis()
    }
    
    override func tearDown() {
        MagickWand.terminus()
    }
    
    func testRandom() {
    }
    
    static var allTests : [(String, (ImageWandTests) -> () throws -> Void)] {
        return [
        ]
    }
}
