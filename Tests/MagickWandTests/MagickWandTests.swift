import Foundation
import XCTest
@testable import MagickWand

class MagickWandTests: XCTestCase {
    
    func testGenesisTerminus() {
        XCTAssertFalse(MagickWand.isInstantiated)
        
        MagickWand.genesis()
        
        XCTAssertTrue(MagickWand.isInstantiated)
        
        MagickWand.terminus()
        
        XCTAssertFalse(MagickWand.isInstantiated)
    }


    static var allTests : [(String, (MagickWandTests) -> () throws -> Void)] {
        return [
            ("Test Genesis - Terminus", testGenesisTerminus),
        ]
    }
}
