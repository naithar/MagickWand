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

import CMagickWand

extension String {
    
    fileprivate static let unknownVersion = "unknown"
}


#if os(Linux)
    fileprivate var wandInstantiated = false
#endif

public func genesis() {
    MagickWandGenesis()
    
    #if os(Linux)
        self.wandInstantiated = true
    #endif
}

public func terminus() {
    MagickWandTerminus()
    
    #if os(Linux)
        self.wandInstantiated = false
    #endif
}

public var isInstantiated: Bool {
    #if os(Linux)
        return IsMagickInstantiated().bool || self.wandInstantiated
    #else
        return IsMagickWandInstantiated().bool
    #endif
}

public var version: String {
    guard let pointer = MagickGetVersion(nil) else {
        return String.unknownVersion
    }

    return String(cString: pointer)
}
    
internal func getString(from wandPointer: OpaquePointer?,
                               using method: (OpaquePointer!) -> (UnsafeMutablePointer<Int8>!)) -> String? {
    guard let pointer = method(wandPointer) else {
        return nil
    }
    
    defer {
        MagickRelinquishMemory(pointer)
    }
    
    return String(cString: pointer)
}
