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

import CMagickWand

extension ImageWand {
    
    var identity: String? {
        return MagickWand.getString(from: self.pointer, using: MagickIdentifyImage)
    }
    
    var format: String? {
        get {
            return MagickWand.getString(from: self.pointer, using: MagickGetFormat)
        }
        set {
            MagickSetFormat(self.pointer, newValue ?? "")
        }
    }
    
    var filename: String? {
        get {
            return MagickWand.getString(from: self.pointer, using: MagickGetFilename)
        }
        set {
            MagickSetFilename(self.pointer, newValue ?? "")
        }
    }
    
    var interlace: MagickWand.Interlace {
        get {
            return MagickWand.Interlace(MagickGetImageInterlaceScheme(self.pointer))
        }
        set {
            MagickSetImageInterlaceScheme(self.pointer, newValue.type)
        }
    }
    
    var orientation: MagickWand.Orientation {
        get {
            return MagickWand.Orientation(MagickGetOrientation(self.pointer))
        }
        set {
            MagickSetOrientation(self.pointer, newValue.type)
        }
    }
    
    var compression: MagickWand.CompressionInfo {
        get {
            let type = MagickWand.Compression(MagickGetCompression(self.pointer))
            let quality = MagickGetCompressionQuality(self.pointer)
            return MagickWand.CompressionInfo(compression: type, quality: quality)
        }
        set {
            MagickSetCompression(self.pointer, newValue.compression.type)
            MagickSetCompressionQuality(self.pointer, newValue.quality)
        }
    }
    
    var gravity: MagickWand.Gravity {
        get {
            return MagickWand.Gravity(MagickGetGravity(self.pointer))
        }
        set {
            MagickSetGravity(self.pointer, newValue.type)
        }
    }
    
    var colorspace: MagickWand.Colorspace {
        get {
            return MagickWand.Colorspace(MagickGetColorspace(self.pointer))
        }
        set {
            MagickSetColorspace(self.pointer, newValue.type)
        }
    }
}
