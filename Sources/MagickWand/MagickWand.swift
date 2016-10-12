// MagickWand.swift
//
// Copyright (c) 2016 Sergey Minakov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif

public struct MagickWand {

    public typealias Size = (width: Int, height: Int)
    public typealias Resolution = (width: Double, height: Double)

    public typealias RGB = (red: Double, green: Double, blue: Double)
    public typealias HSL = (hue: Double, saturation: Double, lightness: Double)

    static let unknownVersion = "unknown"

    public static func genesis() {
        MagickWandGenesis()
    }

    public static func terminus() {
        MagickWandTerminus()
    }

    public static var isInstantiated: Bool {
        #if os(Linux)
            return IsMagickInstantiated().bool
        #else
            return IsMagickWandInstantiated().bool
        #endif
    }

    public static var version: String {
        guard let pointer = MagickGetVersion(nil) else {
            return MagickWand.unknownVersion
        }

        return String(cString: pointer)
    }

    internal static func getString(from wandPointer: OpaquePointer, using method: (OpaquePointer!) -> (UnsafeMutablePointer<Int8>!)) -> String? {
        guard let pointer = method(wandPointer) else {
            return nil
        }

        defer {
            MagickRelinquishMemory(pointer)
        }

        return String(cString: pointer)
    }
}
