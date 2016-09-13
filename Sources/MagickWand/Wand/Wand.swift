// Wand.swift
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

//protocol Wand
// pointer, init, clear, clone, deinit, destroy
//rename to ImageWand
public class Wand {

	internal var pointer: OpaquePointer

	public var isMagickWand: Bool {
		return IsMagickWand(self.pointer).bool
	}

	public var imageBytes: [UInt8] {
		var size: Int = 0
        	guard let imageBlob = MagickGetImageBlob(self.pointer, &size) else {
				return []
			}

			defer {
				MagickRelinquishMemory(imageBlob)
			}

        	var result = [UInt8](repeating: 0, count: size)
        	for i in 0..<size {
            	result[i] = imageBlob[i]
        	}

        	return result
	}

	public var data: Data {
		let array = self.imageBytes
		return Data(bytes: array)
	}

	deinit {
		DestroyMagickWand(self.pointer)
	}

	public init?() {
		guard let pointer = NewMagickWand() else { return nil }
		self.pointer = pointer
	}

	private init(pointer: OpaquePointer) {
		self.pointer = pointer
	}

	public func clear() {
		ClearMagickWand(self.pointer)
	}

	public func clone() -> Wand? {
		guard let pointer = CloneMagickWand(self.pointer) else { return nil }
		return Wand(pointer: pointer)
	}
}
