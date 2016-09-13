// Wand+Compression.swift
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

extension Wand {

    public enum Colorspace {
        // UndefinedColorspace,
        // CMYColorspace,           /* negated linear RGB colorspace */
        // CMYKColorspace,          /* CMY with Black separation */
        // GRAYColorspace,          /* Single Channel greyscale (linear) image */
        // HCLColorspace,
        // HCLpColorspace,
        // HSBColorspace,
        // HSIColorspace,
        // HSLColorspace,
        // HSVColorspace,           /* alias for HSB */
        // HWBColorspace,
        // LabColorspace,
        // LCHColorspace,           /* alias for LCHuv */
        // LCHabColorspace,         /* Cylindrical (Polar) Lab */
        // LCHuvColorspace,         /* Cylindrical (Polar) Luv */
        // LogColorspace,
        // LMSColorspace,
        // LuvColorspace,
        // OHTAColorspace,
        // Rec601YCbCrColorspace,
        // Rec709YCbCrColorspace,
        // RGBColorspace,           /* Linear RGB colorspace */
        // scRGBColorspace,         /* ??? */
        // sRGBColorspace,          /* Default: non-linear sRGB colorspace */
        // TransparentColorspace,
        // xyYColorspace,
        // XYZColorspace,           /* IEEE Color Reference colorspace */
        // YCbCrColorspace,
        // YCCColorspace,
        // YDbDrColorspace,
        // YIQColorspace,
        // YPbPrColorspace,
        // YUVColorspace
    }
}
