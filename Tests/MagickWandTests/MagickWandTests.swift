import Foundation
import XCTest
@testable import MagickWand

func open(file: String, ofType type: String) -> Data? {
    var fileData: Data?
    #if os(Linux)
        fileData = try? Data(contentsOf: URL(fileURLWithPath: "\(file).\(type)"))
    #else
        if let path = Bundle(for: MagickWandTests.self).path(forResource: file, ofType: type) {
            fileData = try? Data(contentsOf: URL(fileURLWithPath: path))
        } else {
            fileData = try? Data(contentsOf: URL(fileURLWithPath: "\(file).\(type)"))
        }
    #endif
    
    return fileData
}


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
