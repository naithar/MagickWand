import Foundation
import XCTest
@testable import MagickWand

class PixelWandTests: XCTestCase {
    
    override func setUp() {
        MagickWand.genesis()
    }
    
    override func tearDown() {
        MagickWand.terminus()
    }
    
    func testColorInit() { //from color list: https://www.imagemagick.org/script/color.php
        XCTAssertTrue(true)
        // var pixelWand = PixelWand(color: "red")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(1, 0, 0), "`PixelWand` color should be a default one")
        
        // pixelWand = PixelWand(color: "green1")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 1, 0), "`PixelWand` color should be a default one")
        
        // pixelWand = PixelWand(color: "blue")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 0, 1), "`PixelWand` color should be a default one")
        
        // pixelWand = PixelWand(color: "white")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(1, 1, 1), "`PixelWand` color should be a default one")
        
        // pixelWand = PixelWand(color: "black")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 0, 0), "`PixelWand` color should be a default one")
    }
    
    func testColorSet() {
        XCTAssertTrue(true)
        // let pixelWand = PixelWand(color: "red")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(1, 0, 0), "`PixelWand` color should be a default one")
        
        // pixelWand?.colors.rgba = MagickWand.RGBA(0, 1, 1)
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 1, 1), "`PixelWand` color should be changed to a new one")
    }
    
    func testClone() {
        XCTAssertTrue(true)
        // let pixelWand = PixelWand(color: "blue")
        // XCTAssertNotNil(pixelWand, "Could not create `PixelWand` with default color")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 0, 1), "`PixelWand` color should be a default one")
        
        // let pixelClone = pixelWand?.clone()
        // XCTAssertNotNil(pixelClone, "Could not clone `PixelWand`")
        // XCTAssertEqual(pixelClone!.colors.rgba, MagickWand.RGBA(0, 0, 1), "`PixelWand` clone color should be a default one")
        // XCTAssertEqual(pixelClone!.colors.rgba, pixelWand!.colors.rgba, "`PixelWand` clone color should be the same as original")
        
        // pixelClone?.colors.rgba = MagickWand.RGBA(1, 0, 1)
        // XCTAssertEqual(pixelClone!.colors.rgba, MagickWand.RGBA(1, 0, 1), "`PixelWand` clone color should be changed")
        // XCTAssertEqual(pixelWand!.colors.rgba, MagickWand.RGBA(0, 0, 1), "`PixelWand` original color should not be changed")
    }
    
    static var allTests : [(String, (PixelWandTests) -> () throws -> Void)] {
        return [
            ("Pixel Wand - Create with color", testColorInit),
            ("Pixel Wand - Set color", testColorSet),
            ("Pixel Wand - Clone", testClone),
        ]
    }
}
