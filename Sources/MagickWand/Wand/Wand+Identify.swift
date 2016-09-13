// Wand+Read.swift
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

extension Wand {

    func identify() -> String? {
        return self.getString(from: MagickIdentifyImage)
    }

    var format: String? {
        return self.getString(from: MagickGetFormat)
    }

    var filename: String? {
        return self.getString(from: MagickGetFilename)
    }

    var interlace: Wand.Interlace {
        //v7 // MagickIdentifyImageType
        // MagickGetImageInterlaceScheme
        return Wand.Interlace(MagickGetImageInterlaceScheme(self.pointer))
    }

    var orientation: Wand.Orientation {
        return Wand.Orientation(MagickGetOrientation(self.pointer))
    }

    var compression: CompressionInfo {
        let type = Wand.Compression(MagickGetCompression(self.pointer))
        let quality = MagickGetCompressionQuality(self.pointer)
        return (type, quality)
    }

    var gravity: Wand.Gravity {
        return Wand.Gravity(MagickGetGravity(self.pointer))
    }

    var colorspace: Wand.Colorspace {
        return Wand.Colorspace(MagickGetColorspace(self.pointer))
    }

    private func getString(from method: (OpaquePointer!) -> (UnsafeMutablePointer<Int8>!)) -> String? {
        guard let pointer = method(self.pointer) else {
            return nil
        }

        defer {
            MagickRelinquishMemory(pointer)
        }

        return String(cString: pointer)
    }
}
