// MagickWand+Compression.swift
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

    public enum Compression {

        case undefined
        case none
        case B44A, B44
        case BZip
        case DXT1, DXT3, DXT5
        case fax
        case group4
        case JBIG1, JBIG2
        case jpeg2000, jpeg
        case lessless
        case LZMA, LZW
        case piz
        case pxr24
        case RLE
        case zip, zipS

        init(_ type: CompressionType) {
            switch type {
            case B44ACompression:
                self = .B44A
            case B44Compression:
                self = .B44
            case BZipCompression:
                self = .BZip
            case DXT1Compression:
                self = .DXT1
            case DXT3Compression:
                self = .DXT3
            case DXT5Compression:
                self = .DXT5
            case FaxCompression:
                self = .fax
            case Group4Compression:
                self = .group4
            case JBIG1Compression:
                self = .JBIG1
            case JBIG2Compression:
                self = .JBIG2
            case JPEG2000Compression:
                self = .jpeg2000
            case JPEGCompression:
                self = .jpeg
            case LosslessJPEGCompression:
                self = .lessless
            case LZMACompression:
                self = .LZMA
            case LZWCompression:
                self = .LZW
            case NoCompression:
                self = .none
            case PizCompression:
                self = .piz
            case Pxr24Compression:
                self = .pxr24
            case RLECompression:
                self = .RLE
            case ZipCompression:
                self = .zip
            case ZipSCompression:
                self = .zipS
            default:
                self = .undefined
            }
        }

        var type: CompressionType {
            switch self {
            case .undefined:
                return UndefinedCompression
            case .B44A:
                return B44ACompression
            case .B44:
                return B44Compression
            case .BZip:
                return BZipCompression
            case .DXT1:
                return DXT1Compression
            case .DXT3:
                return DXT3Compression
            case .DXT5:
                return DXT5Compression
            case .fax:
                return FaxCompression
            case .group4:
                return Group4Compression
            case .JBIG1:
                return JBIG1Compression
            case .JBIG2:
                return JBIG2Compression
            case .jpeg2000:
                return JPEG2000Compression
            case .jpeg:
                return JPEGCompression
            case .lessless:
                return LosslessJPEGCompression
            case .LZMA:
                return LZMACompression
            case .LZW:
                return LZWCompression
            case .none:
                return NoCompression
            case .piz:
                return PizCompression
            case .pxr24:
                return Pxr24Compression
            case .RLE:
                return RLECompression
            case .zip:
                return ZipCompression
            case .zipS:
                return ZipSCompression
            }
        }
    }
}
