// MagickWand+Orientation.swift
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

extension MagickWand {

    public struct ColorInfo {

        private(set) public var colorspace: MagickWand.Colorspace
        private(set) public var isMatte: Bool
        private(set) public var fuzz: Double
        private(set) public var depth: Int
        private(set) public var red: Double
        private(set) public var green: Double
        private(set) public var blue: Double
        private(set) public var opacity: Double
        private(set) public var index: Double

        init(_ info: MagickPixelPacket) {
            self.colorspace = MagickWand.Colorspace(info.colorspace)

            self.isMatte = info.matte.bool

            self.fuzz = Double(info.fuzz)

            self.depth = info.depth

            self.red = Double(info.red)
            self.green = Double(info.green)
            self.blue = Double(info.blue)
            self.opacity = Double(info.opacity)

            self.index = Double(info.index)
        }
    }
}
