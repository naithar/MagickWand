// ImageWand+Resize.swift
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
    
    public func autoOrient() -> Bool {
        return MagickAutoOrientImage(self.pointer).bool
    }
    
    // https://www.imagemagick.org/api/magick-image.php
    // TODO: Resize modes. like AspectFill, AspectFit.
    // TODO: resized, rescaled -> ImageWand
    
    public func resize(width: Double, height: Double, filter: MagickWand.Filter, blur: Double = 1.0) {
        self.resize(width: Int(width), height: Int(height), filter: filter, blur: blur)
    }
    
    public func resize(width: Int, height: Int, filter: MagickWand.Filter, blur: Double = 1.0) {
        MagickResizeImage(self.pointer, width, height, filter.filter, blur)
    }
    
    public func adaptiveResize(width: Double, height: Double) {
        self.adaptiveResize(width: Int(width), height: Int(height))
    }
    
    public func adaptiveResize(width: Int, height: Int) {
        MagickAdaptiveResizeImage(self.pointer, width, height)
    }
    
    public func scale(width: Double, height: Double) {
        self.scale(width: Int(width), height: Int(height))
    }
    
    public func scale(width: Int, height: Int) {
        MagickScaleImage(self.pointer, width, height)
    }
}
