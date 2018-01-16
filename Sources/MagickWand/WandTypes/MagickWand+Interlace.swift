// MagickWand+Interlace.swift
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

//extension MagickWand {

public enum Interlace {
    
    case undefined
    case none
    case line, plane
    case partition
    case gif, jpeg, png
    
    init(_ type: InterlaceType) {
        switch type {
        case NoInterlace:
            self = .none
        case LineInterlace:
            self = .line
        case PlaneInterlace:
            self = .plane
        case PartitionInterlace:
            self = .partition
        case GIFInterlace:
            self = .gif
        case JPEGInterlace:
            self = .jpeg
        case PNGInterlace:
            self = .png
        default:
            self = .undefined
        }
    }
    
    var type: InterlaceType {
        switch self {
        case .undefined:
            return UndefinedInterlace
        case .none:
            return NoInterlace
        case .line:
            return LineInterlace
        case .plane:
            return PlaneInterlace
        case .partition:
            return PartitionInterlace
        case .gif:
            return GIFInterlace
        case .jpeg:
            return JPEGInterlace
        case .png:
            return PNGInterlace
        }
    }
}
//}

