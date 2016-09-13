// PixelWand.swift
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

extension PixelWand {

    //double PixelGetAlpha(const PixelWand *wand)
    //Quantum PixelGetAlphaQuantum(const PixelWand *wand)

    //double PixelGetBlack(const PixelWand *wand)
    //Quantum PixelGetBlackQuantum(const PixelWand *wand)

    //rgb
    //double PixelGetRed(const PixelWand *wand)
    //Quantum PixelGetRedQuantum(const PixelWand *wand)
    //double PixelGetBlue(const PixelWand *wand)
    //Quantum PixelGetBlueQuantum(const PixelWand *wand)
    //double PixelGetGreen(const PixelWand *wand)
    //Quantum PixelGetGreenQuantum(const PixelWand *wand)

    //double PixelGetYellow(const PixelWand *wand)
    //Quantum PixelGetYellowQuantum(const PixelWand *wand)


    //double PixelGetCyan(const PixelWand *wand)
    //Quantum PixelGetCyanQuantum(const PixelWand *wand)

    //char *PixelGetColorAsString(PixelWand *wand)
    //char *PixelGetColorAsNormalizedString(PixelWand *wand)

    //size_t PixelGetColorCount(const PixelWand *wand)

    //double PixelGetFuzz(const PixelWand *wand)

    //void PixelGetHSL(const PixelWand *wand,double *hue,double *saturation, double *lightness)

    //Quantum PixelGetIndex(const PixelWand *wand)

    //double PixelGetMagenta(const PixelWand *wand)
    //Quantum PixelGetMagentaQuantum(const PixelWand *wand)


    //void PixelGetMagickColor(PixelWand *wand,PixelInfo *color)
    //PixelInfo PixelGetPixel(const PixelWand *wand)
}
