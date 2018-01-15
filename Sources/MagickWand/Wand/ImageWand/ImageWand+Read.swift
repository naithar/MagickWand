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
    
    public convenience init?(data: Data) {
        self.init()
        
        self.read(data: data)
    }
    
    public convenience init?<T>(bytes: UnsafePointer<T>, length: Int) {
        self.init()
        
        self.read(bytes: bytes, length: length)
    }
    
    public convenience init?(bytes: [UInt8]) {
        self.init()
        
        self.read(bytes: bytes)
    }
    
    public func read(data: Data) {
        let length = data.count
        let bytes = UnsafeMutablePointer<UInt8>.allocate(capacity: length)
        
        data.copyBytes(to: bytes, count: length)
        
        self.read(bytes: bytes, length: length)
        
        bytes.deallocate(capacity: length)
    }
    
    public func read<T>(bytes: UnsafePointer<T>, length: Int) {
        let bytes = UnsafePointer<UInt8>(OpaquePointer(bytes))
        
        let bufferPointer = UnsafeBufferPointer(start: bytes, count: length)
        let array = Array(bufferPointer)
        
        self.read(bytes: array)
    }
    
    public func read(bytes: [UInt8]) {
        MagickReadImageBlob(self.pointer, bytes, bytes.count)
    }
}
