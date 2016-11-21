// PixelWand.swift
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

import Foundation

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif

public struct Colors {

    private var pointer: OpaquePointer

    init(_ wand: PixelWand) {
        self.init(wand.pointer)
    }

    init(_ pointer: OpaquePointer) {
        self.pointer = pointer
    }

    public var rgb: MagickWand.RGB {
        let red = PixelGetRed(self.pointer)
        let green = PixelGetGreen(self.pointer)
        let blue = PixelGetBlue(self.pointer)
        let alpha = PixelGetAlpha(self.pointer)

        return MagickWand.RGB(red, green, blue, alpha)
    }

    public var hsl: MagickWand.HSL {
        var hue: Double = 0
        var saturation: Double = 0
        var lightness: Double = 0

        PixelGetHSL(self.pointer, &hue, &saturation, &lightness)

        return (hue, saturation, lightness)
    }

    public var black: Double {
        let black = PixelGetBlack(self.pointer)

        return black
    }

    public var yellow: Double {
        let yellow = PixelGetYellow(self.pointer)

        return yellow
    }

    public var cyan: Double {
        let cyan = PixelGetCyan(self.pointer)

        return cyan
    }

    public var magenta: Double {
        let magenta = PixelGetMagenta(self.pointer)

        return magenta
    }

    public var string: String? {
        return MagickWand.getString(from: self.pointer, using: PixelGetColorAsString)
    }

    public var normalizedString: String? {
        return MagickWand.getString(from: self.pointer, using: PixelGetColorAsNormalizedString)
    }

    public var count: Int {
        return PixelGetColorCount(self.pointer)
    }

    public var fuzz: Double {
        return PixelGetFuzz(self.pointer)
    }

    public var info: MagickWand.ColorInfo {
        var infoPacket = MagickPixelPacket()

        PixelGetMagickColor(self.pointer, &infoPacket)

        return MagickWand.ColorInfo(infoPacket)
    }
}

extension PixelWand {

    public var colors: Colors {
        return Colors(self)
    }

    public var index: Quantum {
        return PixelGetIndex(self.pointer)
    }
}
