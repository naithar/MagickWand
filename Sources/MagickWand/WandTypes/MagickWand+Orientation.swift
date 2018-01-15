// MagickWand+Orientation.swift
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

extension MagickWand {

    public enum Orientation {

        case undefined
        case topLeft, topRight
        case bottomRight, bottomLeft
        case leftTop, leftBottom
        case rightTop, rightBottom

        init(_ type: OrientationType) {
            switch type {
            case TopLeftOrientation:
                self = .topLeft
            case TopRightOrientation:
                self = .topRight
            case BottomRightOrientation:
                self = .bottomRight
            case BottomLeftOrientation:
                self = .bottomLeft
            case LeftTopOrientation:
                self = .leftTop
            case RightTopOrientation:
                self = .rightTop
            case RightBottomOrientation:
                self = .rightBottom
            case LeftBottomOrientation:
                self = .leftBottom
            default:
                self = .undefined
            }
        }

        var type: OrientationType {
            switch self {
            case .undefined:
                return UndefinedOrientation
            case .topLeft:
                return TopLeftOrientation
            case .topRight:
                return TopRightOrientation
            case .bottomRight:
                return BottomRightOrientation
            case .bottomLeft:
                return BottomLeftOrientation
            case .leftTop:
                return LeftTopOrientation
            case .rightTop:
                return RightTopOrientation
            case .rightBottom:
                return RightBottomOrientation
            case .leftBottom:
                return LeftBottomOrientation
            }
        }
    }
}
