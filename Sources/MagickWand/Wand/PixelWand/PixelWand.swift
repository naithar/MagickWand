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

public class PixelWand: Wand {
    
    private(set) internal var pointer: OpaquePointer
    
    public var isPixelWand: Bool {
        return IsPixelWand(self.pointer).bool
    }
    
    deinit {
        self.clear()
        self.destroy()
    }
    
    public required init?() {
        guard let pointer = NewPixelWand() else { return nil }
        self.pointer = pointer
    }
    
    public required init(pointer: OpaquePointer) {
        self.pointer = pointer
    }
    
    public convenience init?(color: String) {
        self.init()
        
        let result = PixelSetColor(self.pointer, color).bool
        
        guard result else {
            DestroyPixelWand(self.pointer)
            return nil
        }
    }
    
    public func clear() {
        ClearPixelWand(self.pointer)
    }
    
    public func clone() -> Self? {
        guard let pointer = ClonePixelWand(self.pointer) else { return nil }
        return type(of: self).init(pointer: pointer)
    }
    
    public func destroy() {
        guard MagickWand.isInstantiated else { return }
        DestroyPixelWand(self.pointer)
    }
}
