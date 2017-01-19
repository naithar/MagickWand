import XCTest
@testable import MagickWandTests

XCTMain([
     testCase(MagickWandTests.allTests),
     testCase(ImageWandTests.allTests),
     testCase(PixelWandTests.allTests)
])
