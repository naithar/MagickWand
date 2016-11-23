import Foundation
import XCTest
@testable import MagickWand

class MagickWandTests: XCTestCase {
    func testWand() {

        let version = MagickWand.version
        print(version)

        XCTAssert(!version.isEmpty, "version should not be empty")
        XCTAssertNotEqual(version, MagickWand.unknownVersion, "version should not be unknown")

        MagickWand.genesis()

        //100x50
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: "rect.png")) else {
            XCTFail("data should not be nil")
            return
        }

        do { //wand should not exist on terminus
            guard let wand = ImageWand(data: data) else {
                XCTFail("image should not be nil")
                return
            }

            XCTAssertEqual(wand.size.width, 100, "wrong image width")
            XCTAssertEqual(wand.size.height, 50, "wrong image height")

            guard let cloned = wand.clone() else {
                XCTFail("clone should exist")
                return
            }

            XCTAssertEqual(cloned.size.width, 100, "wrong cloned image width")
            XCTAssertEqual(cloned.size.height, 50, "wrong cloned image height")

            wand.clear()

            XCTAssertEqual(wand.size.width, 0, "wrong image width after clear")
            XCTAssertEqual(wand.size.height, 0, "wrong image height after clear")

            XCTAssertEqual(cloned.size.width, 100, "cloned image width should not change after parent clear")
            XCTAssertEqual(cloned.size.height, 50, "cloned image height should not change after parent clear")

            cloned.resize(width: 40, height: 40, filter: .lanczos)

            XCTAssertEqual(cloned.size.width, 40, "cloned image width wasn't changed on resize")
            XCTAssertEqual(cloned.size.height, 40, "cloned image height wasn't changed on resize")

            cloned.adaptiveResize(width: 90, height: 45)

            XCTAssertEqual(cloned.size.width, 90, "cloned image width wasn't changed on adaptive resize")
            XCTAssertEqual(cloned.size.height, 45, "cloned image height wasn't changed on adaptive resize")

            cloned.scale(width: 100, height: 50)

            XCTAssertEqual(cloned.size.width, 100, "cloned image width wasn't changed on scale")
            XCTAssertEqual(cloned.size.height, 50, "cloned image height wasn't changed on scale")

            wand.read(data: data)

            XCTAssertEqual(cloned.size.width, 100, "wrong image width after reading data")
            XCTAssertEqual(cloned.size.height, 50, "wrong image height after reading data")

            let size = wand.size(for: 80)

            XCTAssertEqual(size.width, 80, "wrong size for dimension")
            XCTAssertEqual(size.height, 40, "wrong size for dimension")

            print(wand[option: .custom("jpeg:perserve")])

            print(wand.identity)
            print(wand.format)
            wand.format = "jpeg"
            print(wand.format)
            print(wand.filename)
            print(wand.interlace)
            print(wand.orientation)
            print(wand.size)
            print("resolution")
            print(wand.resolution)
            print(wand.compression)
            print(wand.gravity)
            print(wand.colorspace)

            

            func showColors(_ color: PixelWand?) {
                print(color?.colors.rgba)
                print(color?.colors.hsl)
                print(color?.colors.cmy)

                print(color?.colors.info)

                print(color?.colors.string)
                print(color?.colors.normalizedString)

                print(color?.colors.count)
            }

            print("background")
            print(wand.background)
            showColors(wand.background)

            print("border")
            print(wand.border)
            showColors(wand.border)
            
            print("matte")
            print(wand.matte)
            showColors(wand.matte)
            
            print("pixel")
            showColors(wand.pixel(x: 0, y: 0))

        }

        let isInstantiatedBefore = MagickWand.isInstantiated
        XCTAssertEqual(isInstantiatedBefore, true, "value of 'isInstantiated' value before 'terminus()' is wrong")

        MagickWand.terminus()

        let isInstantiatedAfter = MagickWand.isInstantiated

        XCTAssertEqual(isInstantiatedAfter, false, "value of 'isInstantiated' value after 'terminus()' is wrong")
    }


    static var allTests : [(String, (MagickWandTests) -> () throws -> Void)] {
        return [
            ("testWand", testWand),
        ]
    }
}
