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
    
    func testInitWithColor() {
        XCTAssertTrue(true)
        // let imageWand = ImageWand(color: "red", size: MagickWand.Size(width: 40, height: 40))
        // XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        // XCTAssertNotNil(imageWand!.data, "`ImageWand` should have Data")
        
        // XCTAssertEqual(imageWand?.size.width, 40, "Created `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size.height, 40, "Created `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size, MagickWand.Size(width: 40, height: 40), "Created `ImageWand` has wrong size")
    }
    
    func testInitWithData() {
        XCTAssertTrue(true)
        // let data = open(file: "rect", ofType: "png")
        // XCTAssertNotNil(data, "File should exist")
        // let imageWand = ImageWand(data: data!)
        // XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        // XCTAssertNotNil(imageWand!.data, "`ImageWand` should have Data")
        
        // XCTAssertEqual(imageWand?.size.width, 100, "Created `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size.height, 50, "Created `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size, MagickWand.Size(width: 100, height: 50), "Created `ImageWand` has wrong size")
        
        // print(imageWand!.resolution)
    }
    
    func testClone() {
        XCTAssertTrue(true)
        // let data = open(file: "rect", ofType: "png")
        // XCTAssertNotNil(data, "File should exist")
        // let imageWand = ImageWand(data: data!)
        // XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        // XCTAssertNotNil(imageWand!.data, "`ImageWand` should have Data")
        
        // let imageClone = imageWand?.clone()
        // XCTAssertNotNil(imageClone, "`ImageWand` clone should have been created")
        // XCTAssertNotNil(imageClone!.data, "`ImageWand` clone should have Data")
    }
    
    func testResize() {
        XCTAssertTrue(true)
        // let data = open(file: "rect", ofType: "png")
        // XCTAssertNotNil(data, "File should exist")
        // let imageWand = ImageWand(data: data!)
        // XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        // XCTAssertNotNil(imageWand!.data, "`ImageWand` should have Data")
        
        // imageWand?.resize(width: 50, height: 10, filter: .box)
        
        // XCTAssertEqual(imageWand?.size.width, 50, "Resized `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size.height, 10, "Resized `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size, MagickWand.Size(width: 50, height: 10), "Resized `ImageWand` has wrong size")
    }
    
    func testScale() {
        XCTAssertTrue(true)
        // let data = open(file: "rect", ofType: "png")
        // XCTAssertNotNil(data, "File should exist")
        // let imageWand = ImageWand(data: data!)
        // XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        // XCTAssertNotNil(imageWand!.data, "`ImageWand` should have Data")
        
        // imageWand?.scale(width: 100, height: 5)
        
        // XCTAssertEqual(imageWand?.size.width, 100, "Rescaled `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size.height, 5, "Rescaled `ImageWand` has wrong size")
        // XCTAssertEqual(imageWand?.size, MagickWand.Size(width: 100, height: 5), "Rescaled `ImageWand` has wrong size")
    }
    
    static var allTests : [(String, (ImageWandTests) -> () throws -> Void)] {
        return [
            ("Image Wand - Init with color", testInitWithColor),
            ("Image Wand - Init with data", testInitWithData),
            ("Image Wand - Clone", testClone),
            ("Image Wand - Resize", testResize),
            ("Image Wand - Scale", testScale),
        ]
    }
}
