import Foundation
import XCTest
@testable import MagickWand

class ImageWandTests: XCTestCase {
    
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
        
        Utils.delete(fileName: "images/testInitWithColor.png")
        
        XCTAssertTrue(Utils.save(fileName: "images/testInitWithColor.png", data: data))
        
        guard let savedImageWand = self.open(file: "images/testInitWithColor", ofType: "png") else { return }
        self.basicChecks(forWand: savedImageWand, size: size)
        
        Utils.delete(fileName: "images/testInitWithColor.png")
    }
    
    func testInitWithFilePath() {
        guard let imageWand = ImageWand.init(filePath: Utils.path() + "/images/source.png") else {
            XCTFail("`ImageWand` should have been created")
            return
        }
        
        Utils.delete(fileName: "images/testInitWithFilePath.png")
        
        XCTAssertTrue(Utils.save(fileName: "images/testInitWithFilePath.png", data: imageWand.data!))
        
        guard let savedImageWand = self.open(file: "images/testInitWithFilePath", ofType: "png") else { return }
        self.basicChecks(forWand: savedImageWand, size: Size(width: 100, height: 50))
        
        Utils.delete(fileName: "images/testInitWithFilePath.png")
    }
    
    private func initWithData(file: String, ofType type: String) {
        guard let imageWand = self.open(file: file, ofType: type) else { return }
        self.basicChecks(forWand: imageWand, size: Size.init(width: 100, height: 50))
    }
    
    private func clone(file: String, ofType type: String) {
        guard let imageWand = self.open(file: file, ofType: type) else { return }
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        guard let imageClone = imageWand.clone() else {
            XCTFail("`ImageWand` clone should have been created")
            return
        }
        XCTAssertNotNil(imageClone.data, "`ImageWand` clone should have Data")
        self.basicChecks(forWand: imageClone, size: Size.init(width: 100, height: 50))
    }
    
    private func resize(file: String, ofType type: String) {
        guard let imageWand = self.open(file: file, ofType: type) else { return }
        XCTAssertNotNil(imageWand, "`ImageWand` should have been created")
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        imageWand.resize(width: 50, height: 10, filter: .box)
        
        self.basicChecks(forWand: imageWand, size: Size.init(width: 50, height: 10))
    }
    
    private func scale(file: String, ofType type: String) {
        guard let imageWand = self.open(file: file, ofType: type) else { return }
        XCTAssertNotNil(imageWand.data, "`ImageWand` should have Data")
        
        imageWand.scale(width: 100, height: 5)
        
        self.basicChecks(forWand: imageWand, size: Size.init(width: 100, height: 5))
    }
    
    private let variants: [(name: String, type: String)] = [
        ("PNG", "png"),
        ("JPEG", "jpeg"),
//        ("PDF", "pdf"), //FIXME: does not work on linux
        ("GIF", "gif"),
        //("SVG", "svg"), //FIXME: cannot create or read
        ("TIFF", "tiff"),
    ]
    
    private func performVariants(action: (String, String) -> Void) {
        let folder = "images/converted/"
        self.variants.forEach {
            let file = folder + $0.name
            print("Running test for file at \(file).\($0.type)")
            action(file, $0.type)
        }
    }
    
    func testInitWithData() {
        self.performVariants(action: self.initWithData(file:ofType:))
    }
    
    func testClone() {
        self.performVariants(action: self.clone(file:ofType:))
    }
    
    func testResize() {
        self.performVariants(action: self.resize(file:ofType:))
    }
    
    func testScale() {
        self.performVariants(action: self.scale(file:ofType:))
    }
    
    private func checkPixel(forWand imageWand: ImageWand, at location: CGPoint, rgba: RGBA) {
        guard let pixelWand = imageWand.pixel(x: Int(location.x), y: Int(location.y)) else {
            XCTFail("`Pixel Wand` should exist")
            return
        }
        XCTAssertTrue(pixelWand.isPixelWand, "Should be `Pixel Wand`")
        XCTAssertEqual(pixelWand.colors.rgba, rgba, "Wrong Color at \(location)")
    }
    
    func testColor() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        self.checkPixel(forWand: imageWand,
                        at: CGPoint.init(x: 0, y: 0),
                        rgba: RGBA.init(13.0 / 255.0, 13.0 / 255.0, 13.0 / 255.0))
        
        self.checkPixel(forWand: imageWand,
                        at: CGPoint.init(x: 35, y: 25),
                        rgba: RGBA.init(227 / 255.0, 16.0 / 255.0, 16.0 / 255.0))
        
        self.checkPixel(forWand: imageWand,
                        at: CGPoint.init(x: 60, y: 25),
                        rgba: RGBA.init(227 / 255.0, 16.0 / 255.0, 16.0 / 255.0, 128 / 255.0))
        
        self.checkPixel(forWand: imageWand,
                        at: CGPoint.init(x: 80, y: 25),
                        rgba: RGBA.init(0, 0, 0, 0))
    }
    
    func testClear() {
        guard let imageWand = self.open(file: "images/source", ofType: "png") else { return }
        self.checkPixel(forWand: imageWand,
                        at: CGPoint.init(x: 0, y: 0),
                        rgba: RGBA.init(13.0 / 255.0, 13.0 / 255.0, 13.0 / 255.0))
        
        imageWand.clear()
        
        XCTAssertNil(imageWand.data)
        XCTAssertEqual(imageWand.size, Size.init(width: 0, height: 0))
    }
    
    static var allTests : [(String, (ImageWandTests) -> () throws -> Void)] {
        return [
            ("Image Wand - Init with color", testInitWithColor),
            ("Image Wand - Init with filePath", testInitWithFilePath),
            ("Image Wand - Init with data", testInitWithData),
            ("Image Wand - Clone", testClone),
            ("Image Wand - Resize", testResize),
            ("Image Wand - Scale", testScale),
            ("Image Wand - Color", testColor),
            ("Image Wand - Clear", testClear),
        ]
    }
}
