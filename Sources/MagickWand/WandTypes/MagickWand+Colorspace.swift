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

#if os(Linux)
import CMagickWandLinux
#else
import CMagickWandOSX
#endif

extension MagickWand {

    public enum Colorspace {

        case undefined
        // UndefinedColorspace,
        case CMY
        // CMYColorspace,           /* negated linear RGB colorspace */
        case CMYK
        // CMYKColorspace,          /* CMY with Black separation */
        case gray
        // GRAYColorspace,          /* Single Channel greyscale (linear) image */
        case HCL
        // HCLColorspace,
        case HCLp
        // HCLpColorspace,
        case HSB
        // HSBColorspace,
        case HSI
        // HSIColorspace,
        case HSL
        // HSLColorspace,
        case HSV
        // HSVColorspace,           /* alias for HSB */
        case HWB
        // HWBColorspace,
        case lab
        // LabColorspace,
        case LCH
        // LCHColorspace,           /* alias for LCHuv */
        case LCHab
        // LCHabColorspace,         /* Cylindrical (Polar) Lab */
        case LCHub
        // LCHuvColorspace,         /* Cylindrical (Polar) Luv */
        case log
        // LogColorspace,
        case LMS
        // LMSColorspace,
        case luv
        // LuvColorspace,
        case OHTA
        // OHTAColorspace,
        case rec601YCbCr
        // Rec601YCbCrColorspace,
        case rec709YCbCr
        // Rec709YCbCrColorspace,
        case RGB
        // RGBColorspace,           /* Linear RGB colorspace */
        case scRGB
        // scRGBColorspace,         /* ??? */
        case sRGB
        // sRGBColorspace,          /* Default: non-linear sRGB colorspace */
        case transparent
        // TransparentColorspace,
        case xyY
        // xyYColorspace,
        case XYZ
        // XYZColorspace,           /* IEEE Color Reference colorspace */
        case YCbCr
        // YCbCrColorspace,
        case YCC
        // YCCColorspace,
        case YDbDr
        // YDbDrColorspace,
        case YIQ
        // YIQColorspace,
        case YPbPr
        // YPbPrColorspace,
        case YUV
        // YUVColorspace

        init(_ type: ColorspaceType) {
            switch type {
            case CMYColorspace:
                self = .CMY
            case CMYKColorspace:
                self = .CMYK
            case GRAYColorspace:
                self = .gray
            case HCLColorspace:
                self = .HCL
            case HCLpColorspace:
                self = .HCLp
            case HSBColorspace:
                self = .HSB
            case HSIColorspace:
                self = .HSI
            case HSLColorspace:
                self = .HSL
            case HSVColorspace:
                self = .HSV
            case HWBColorspace:
                self = .HWB
            case LabColorspace:
                self = .lab
            case LCHColorspace:
                self = .LCH
            case LCHabColorspace:
                self = .LCHab
            case LCHuvColorspace:
                self = .LCHub
            case LogColorspace:
                self = .log
            case LMSColorspace:
                self = .LMS
            case LuvColorspace:
                self = .luv
            case OHTAColorspace:
                self = .OHTA
            case Rec601YCbCrColorspace:
                self = .rec601YCbCr
            case Rec709YCbCrColorspace:
                self = .rec709YCbCr
            case RGBColorspace:
                self = .RGB
            case scRGBColorspace:
                self = .scRGB
            case sRGBColorspace:
                self = .sRGB
            case TransparentColorspace:
                self = .transparent
            case xyYColorspace:
                self = .xyY
            case XYZColorspace:
                self = .XYZ
            case YCbCrColorspace:
                self = .YCbCr
            case YCCColorspace:
                self = .YCC
            case YDbDrColorspace:
                self = .YDbDr
            case YIQColorspace:
                self = .YIQ
            case YPbPrColorspace:
                self = .YPbPr
            case YUVColorspace:
                self = .YUV
            default:
                self = .undefined
            }
        }

        var type: ColorspaceType {
            switch self {
            case .undefined:
                return UndefinedColorspace
            case .CMY:
                return CMYColorspace
            case .CMYK:
                return CMYKColorspace
            case .gray:
                return GRAYColorspace
            case .HCL:
                return HCLColorspace
            case .HCLp:
                return HCLpColorspace
            case .HSB:
                return HSBColorspace
            case .HSI:
                return HSIColorspace
            case .HSL:
                return HSLColorspace
            case .HSV:
                return HSVColorspace
            case .HWB:
                return HWBColorspace
            case .lab:
                return LabColorspace
            case .LCH:
                return LCHColorspace
            case .LCHab:
                return LCHabColorspace
            case .LCHub:
                return LCHuvColorspace
            case .log:
                return LogColorspace
            case .LMS:
                return LMSColorspace
            case .luv:
                return LuvColorspace
            case .OHTA:
                return OHTAColorspace
            case .rec601YCbCr:
                return Rec601YCbCrColorspace
            case .rec709YCbCr:
                return Rec709YCbCrColorspace
            case .RGB:
                return RGBColorspace
            case .scRGB:
                return scRGBColorspace
            case .sRGB:
                return sRGBColorspace
            case .transparent:
                return TransparentColorspace
            case .xyY:
                return xyYColorspace
            case .XYZ:
                return XYZColorspace
            case .YCbCr:
                return YCbCrColorspace
            case .YCC:
                return YCCColorspace
            case .YDbDr:
                return YDbDrColorspace
            case .YIQ:
                return YIQColorspace
            case .YPbPr:
                return YPbPrColorspace
            case .YUV:
                return YUVColorspace
            }
        }
    }
}
