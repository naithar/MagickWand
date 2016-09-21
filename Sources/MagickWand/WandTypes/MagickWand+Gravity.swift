// MagickWand+Gravity.swift
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

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif

extension MagickWand {
    
    public enum Gravity {
        
        case undefined
        // UndefinedGravity,
        case forget
        // ForgetGravity = 0,
        case northWest
        // NorthWestGravity = 1,
        case north
        // NorthGravity = 2,
        case northEast
        // NorthEastGravity = 3,
        case west
        // WestGravity = 4,
        case center
        // CenterGravity = 5,
        case east
        // EastGravity = 6,
        case southWest
        // SouthWestGravity = 7,
        case south
        // SouthGravity = 8,
        case southEast
        // SouthEastGravity = 9
        
        init(_ type: GravityType) {
            switch type {
            case ForgetGravity:
                self = .forget
            case NorthWestGravity:
                self = .northWest
            case NorthGravity:
                self = .north
            case NorthEastGravity:
                self = .northEast
            case WestGravity:
                self = .west
            case CenterGravity:
                self = .center
            case EastGravity:
                self = .east
            case SouthWestGravity:
                self = .southWest
            case SouthGravity:
                self = .south
            case SouthEastGravity:
                self = .southEast
            default:
                self = .undefined
            }
        }
        
        var type: GravityType {
            switch self {
            case .undefined:
                return UndefinedGravity
            case .forget:
                return ForgetGravity
            case .northWest:
                return NorthWestGravity
            case .north:
                return NorthGravity
            case .northEast:
                return NorthEastGravity
            case .west:
                return WestGravity
            case .center:
                return CenterGravity
            case .east:
                return EastGravity
            case .southWest:
                return SouthWestGravity
            case .south:
                return SouthGravity
            case .southEast:
                return SouthEastGravity
            }
        }
    }
}
