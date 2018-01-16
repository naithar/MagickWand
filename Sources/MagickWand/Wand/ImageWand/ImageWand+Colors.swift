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
    
    //TODO: Reimplement.
    public var background: PixelWand? {
        get {
            let background = PixelWand()
            
            guard MagickGetImageBackgroundColor(self.pointer, background?.pointer).bool else {
                return nil
            }
            
            return background
        }
        set {
            guard let newValue = newValue else {
                return
            }
            
            MagickGetImageBackgroundColor(self.pointer, newValue.pointer)
        }
    }
    
    public var border: PixelWand? {
        get {
            let border = PixelWand()
            
            guard MagickGetImageBorderColor(self.pointer, border?.pointer).bool else {
                return nil
            }
            
            return border
        }
        set {
            guard let newValue = newValue else {
                return
            }
            
            MagickSetImageBorderColor(self.pointer, newValue.pointer)
        }
    }
    
    public var matte: PixelWand? {
        get {
            let matte = PixelWand()
            
            guard MagickGetImageMatteColor(self.pointer, matte?.pointer).bool else {
                return nil
            }
            
            return matte
        }
        set {
            guard let newValue = newValue else {
                return
            }
            
            MagickSetImageMatteColor(self.pointer, newValue.pointer)
        }
    }
    
    //TODO: alpha channel
    
    // https://bugs.php.net/bug.php?id=73840
    public func pixel(x: Int, y: Int) -> PixelWand? {
        let pixel = PixelWand()
        
        guard MagickGetImagePixelColor(self.pointer, x, y, pixel?.pointer).bool else {
            return nil
        }
        
        return pixel
    }
}
