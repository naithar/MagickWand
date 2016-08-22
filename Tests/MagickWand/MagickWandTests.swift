import Foundation
import XCTest
@testable import MagickWand

class MagickWandTests: XCTestCase {
    func testExample() {
        MagickWand.genesis()

        do {
            let wand = Wand()
            wand?.clear()

            print(wand?.size)
            let dataWand = Wand(data: Data())

            let cloned = wand?.clone()
            wand?.resize(width: 30, height: 30, filter: .lanczos)
            print(wand?.isMagickWand)
            print(wand)

        }
        print(MagickWand.isInstantiated)
        print(MagickWand.version)

        // XCTAssertEqual(MagickWand().text, "Hello, World!")
    }


    static var allTests : [(String, (MagickWandTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
