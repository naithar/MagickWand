// ImageWand+Read.swift
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

extension ImageWand {
    
    func identify() -> String? {
        return self.getString(from: MagickIdentifyImage)
    }
    
    var format: String? {
        return self.getString(from: MagickGetFormat)
    }
    
    var filename: String? {
        return self.getString(from: MagickGetFilename)
    }
    
    var interlace: MagickWand.Interlace {
        //v7 // MagickIdentifyImageType
        // MagickGetImageInterlaceScheme
        return MagickWand.Interlace(MagickGetImageInterlaceScheme(self.pointer))
    }
    
    var orientation: MagickWand.Orientation {
        return MagickWand.Orientation(MagickGetOrientation(self.pointer))
    }
    
    var compression: MagickWand.CompressionInfo {
        let type = MagickWand.Compression(MagickGetCompression(self.pointer))
        let quality = MagickGetCompressionQuality(self.pointer)
        return (type, quality)
    }
    
    var gravity: MagickWand.Gravity {
        return MagickWand.Gravity(MagickGetGravity(self.pointer))
    }
    
    var colorspace: MagickWand.Colorspace {
        return MagickWand.Colorspace(MagickGetColorspace(self.pointer))
    }
    
    //PixelWand *MagickGetBackgroundColor(MagickWand *wand)
    
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
