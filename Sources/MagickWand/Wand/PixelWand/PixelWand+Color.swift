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

import CMagickWand

extension PixelWand {
    
    public struct Colors {
        
        private var pointer: OpaquePointer
        
        init(_ wand: PixelWand) {
            self.init(wand.pointer)
        }
        
        init(_ pointer: OpaquePointer) {
            self.pointer = pointer
        }
        
        public var rgba: MagickWand.RGBA {
            get {
                let red = PixelGetRed(self.pointer)
                let green = PixelGetGreen(self.pointer)
                let blue = PixelGetBlue(self.pointer)
                
                let alpha = PixelGetAlpha(self.pointer)
                
                return MagickWand.RGBA(red, green, blue, alpha)
            }
            set {
                PixelSetRed(self.pointer, newValue.red)
                PixelSetGreen(self.pointer, newValue.green)
                PixelSetBlue(self.pointer, newValue.blue)
                PixelSetAlpha(self.pointer, newValue.alpha)
            }
        }
        
        public var hsl: MagickWand.HSL {
            get {
                var hue: Double = 0
                var saturation: Double = 0
                var lightness: Double = 0
                
                PixelGetHSL(self.pointer, &hue, &saturation, &lightness)
                
                return MagickWand.HSL(hue, saturation, lightness)
            }
            set {
                PixelSetHSL(self.pointer, newValue.hue, newValue.saturation, newValue.lightness)
            }
        }
        
        public var cmy: MagickWand.CMY {
            get {
                let (cyan, magenta, yellow) = (
                    PixelGetCyan(self.pointer),
                    PixelGetMagenta(self.pointer),
                    PixelGetYellow(self.pointer)
                )
                
                return MagickWand.CMY(cyan, magenta, yellow)
            }
            set {
                PixelSetCyan(self.pointer, newValue.cyan)
                PixelSetMagenta(self.pointer, newValue.magenta)
                PixelSetYellow(self.pointer, newValue.yellow)
            }
        }
        
        public var black: Double {
            get {
                return PixelGetBlack(self.pointer)
            }
            set {
                PixelSetBlack(self.pointer, newValue)
            }
        }
        
        public var string: String? {
            return MagickWand.getString(from: self.pointer, using: PixelGetColorAsString)
        }
        
        public var normalizedString: String? {
            return MagickWand.getString(from: self.pointer, using: PixelGetColorAsNormalizedString)
        }
        
        public var count: Int {
            get {
                return PixelGetColorCount(self.pointer)
            }
            set {
                PixelSetColorCount(self.pointer, newValue)
            }
        }
        
        public var info: MagickWand.ColorInfo {
            get {
                var infoPacket = MagickPixelPacket()
                
                #if !os(Linux)
                    PixelGetMagickColor(self.pointer, &infoPacket)
                #endif
                return MagickWand.ColorInfo(infoPacket)
            }
            set {
                var packet = newValue.info
                PixelSetMagickColor(self.pointer, &packet)
            }
        }
    }
    
    public var colors: Colors {
        get {
            return Colors(self)
        }
        set { }
        // As `Colors` struct receives `PixelWand` pointer on initialization
        // A color will be changed without any other code changes.
        // TODO: This part should probably be changed.
    }
    
    public var index: Quantum {
        get {
            return PixelGetIndex(self.pointer)
        }
        set {
            PixelSetIndex(self.pointer, newValue)
        }
    }
}
