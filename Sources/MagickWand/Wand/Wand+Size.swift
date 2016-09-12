// Wand+Size.swift
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


extension Wand {

    public typealias Size = (width: Int, height: Int)

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
}
