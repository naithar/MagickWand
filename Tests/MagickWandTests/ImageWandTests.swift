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
        let size = Size.init(width: 40, height: 40)
        guard let imageWand = ImageWand(color: "red", size: size) else {
            XCTFail("`ImageWand` should have been created")
            return
        }
        self.basicChecks(forWand: imageWand, size: size)
        
        guard let data = imageWand.data else {
            XCTFail("no data for color image")
            return
        }
        
        XCTAssertTrue(Utils.save(fileName: "images/testInitWithColor.png", data: data))
        
        guard let savedImageWand = self.open(file: "images/testInitWithColor", ofType: "png") else { return }
        self.basicChecks(forWand: savedImageWand, size: size)
        
        Utils.delete(fileName: "images/testInitWithColor.png")
    }
    
    private func open(file: String, ofType type: String) -> ImageWand? {
        guard let data = Utils.open(file: file, ofType: type) else {
            XCTFail("File should exist")
            return nil
        }
        
        guard let imageWand = ImageWand(data: data) else {
            XCTFail("`ImageWand` should have been created")
            return nil
        }
        
        return imageWand
    }
    
    private func basicChecks(forWand imageWand: ImageWand, size: MagickWand.Size) {
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        XCTAssertEqual(imageWand.size.width, size.width, "Created `ImageWand` has wrong size")
        XCTAssertEqual(imageWand.size.height, size.height, "Created `ImageWand` has wrong size")
        XCTAssertEqual(imageWand.size,
                       MagickWand.Size(width: size.width, height: size.height),
                       "Created `ImageWand` has wrong size")
    }
    
    func testInitWithData() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        self.basicChecks(forWand: imageWand, size: Size.init(width: 100, height: 50))
    }
    
    func testClone() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        guard let imageClone = imageWand.clone() else {
            XCTFail("`ImageWand` clone should have been created")
            return
        }
        XCTAssertNotNil(imageClone.data, "`ImageWand` clone should have Data")
        self.basicChecks(forWand: imageClone, size: Size.init(width: 100, height: 50))
    }
    
    func testResize() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        imageWand.resize(width: 50, height: 10, filter: .box)
        
        self.basicChecks(forWand: imageWand, size: Size.init(width: 50, height: 10))
    }
    
    func testScale() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        imageWand.scale(width: 100, height: 5)
        
        self.basicChecks(forWand: imageWand, size: Size.init(width: 100, height: 5))
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
