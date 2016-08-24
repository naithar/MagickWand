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

public class Wand {

	private var pointer: OpaquePointer

	public var isMagickWand: Bool {
		return IsMagickWand(self.pointer).bool
	}

	public var imageBytes: [UInt8] {
		var size: Int = 0
        	guard let imageBlob = MagickGetImageBlob(self.pointer, &size) else { return [] }
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

	public var size: Size {
		let (width, height) = (
			Int(MagickGetImageWidth(self.pointer)),
			Int(MagickGetImageHeight(self.pointer))
		)

		return (width, height)
	}

	public func size(for dimension: Int) -> Size {
		let size = self.size
		var result = (width: 0, height: 0)

		if size.width == 0
			|| size.height == 0 {
				return (0, 0)
		}

		let ratio = Double(size.height) / Double(size.width)

		if ratio > 1 {
			result.height = dimension
			result.width = Int(Double(result.height) / ratio)
		} else if ratio < 1 {
			result.width = dimension
			result.height = Int(ratio * Double(result.width))
		} else {
			result.width = dimension
			result.height = dimension
		}

		return result
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

	public func clear() {
		ClearMagickWand(self.pointer)
	}

	public func clone() -> Wand? {
		guard let pointer = CloneMagickWand(self.pointer) else { return nil }
		return Wand(pointer: pointer)
	}

	public func read(data: Data) {
		let length = data.count
		let bytes = UnsafeMutablePointer<UInt8>.allocate(capacity: length)

		data.copyBytes(to: bytes, count: length)

		self.read(bytes: bytes, length: length)

		bytes.deallocate(capacity: length)
	}

	public func read<T>(bytes: UnsafePointer<T>, length: Int) {
		let bytes = UnsafePointer<UInt8>(bytes)

		let bufferPointer = UnsafeBufferPointer(start: bytes, count: length)
		let array = Array(bufferPointer)

		self.read(bytes: array)
	}

	public func read(bytes: [UInt8]) {
		MagickReadImageBlob(self.pointer, bytes, bytes.count)
	}

	public func resize(width: Int, height: Int, filter: Filter, blur: Double = 1.0) {
		MagickResizeImage(self.pointer, width, height, filter.filter, blur)
	}

	public func adaptiveResize(width: Int, height: Int) {
		MagickAdaptiveResizeImage(self.pointer, width, height)
	}

	public func scale(width: Int, height: Int) {
		MagickScaleImage(self.pointer, width, height)
	}
}
