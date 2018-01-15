// ImageWand+Read.swift
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

import CMagickWand
/*
typedef enum
{
  MagickUndefinedOptions = -1,
  MagickAlignOptions = 0,
  MagickAlphaChannelOptions,
  MagickBooleanOptions,
  MagickCacheOptions,
  MagickChannelOptions,
  MagickClassOptions,
  MagickClipPathOptions,
  MagickCoderOptions,
  MagickColorOptions,
  MagickColorspaceOptions,
  MagickCommandOptions,
  MagickComplexOptions,
  MagickComplianceOptions,
  MagickComposeOptions,
  MagickCompressOptions,
  MagickConfigureOptions,
  MagickDataTypeOptions,
  MagickDebugOptions,
  MagickDecorateOptions,
  MagickDelegateOptions,
  MagickDirectionOptions,
  MagickDisposeOptions,
  MagickDistortOptions,
  MagickDitherOptions,
  MagickEndianOptions,
  MagickEvaluateOptions,
  MagickFillRuleOptions,
  MagickFilterOptions,
  MagickFontOptions,
  MagickFontsOptions,
  MagickFormatOptions,
  MagickFunctionOptions,
  MagickGradientOptions,
  MagickGravityOptions,
  MagickIntensityOptions,
  MagickIntentOptions,
  MagickInterlaceOptions,
  MagickInterpolateOptions,
  MagickKernelOptions,
  MagickLayerOptions,
  MagickLineCapOptions,
  MagickLineJoinOptions,
  MagickListOptions,
  MagickLocaleOptions,
  MagickLogEventOptions,
  MagickLogOptions,
  MagickMagicOptions,
  MagickMethodOptions,
  MagickMetricOptions,
  MagickMimeOptions,
  MagickModeOptions,
  MagickModuleOptions,
  MagickMorphologyOptions,
  MagickNoiseOptions,
  MagickOrientationOptions,
  MagickPixelChannelOptions,
  MagickPixelIntensityOptions,
  MagickPixelMaskOptions,
  MagickPixelTraitOptions,
  MagickPolicyOptions,
  MagickPolicyDomainOptions,
  MagickPolicyRightsOptions,
  MagickPreviewOptions,
  MagickPrimitiveOptions,
  MagickQuantumFormatOptions,
  MagickResolutionOptions,
  MagickResourceOptions,
  MagickSparseColorOptions,
  MagickStatisticOptions,
  MagickStorageOptions,
  MagickStretchOptions,
  MagickStyleOptions,
  MagickThresholdOptions,
  MagickTypeOptions,
  MagickValidateOptions,
  MagickVirtualPixelOptions,
  MagickWeightOptions
} CommandOption;
*/

extension ImageWand {

    public enum Option {
//        case resolution = "resolution"
//        case interlace = "interlace"
//        case color = "color"
//        case type = "type"
        
        case custom(String)
        
        var value: String {
            switch self {
            case .custom(let value):
                return value
            }
        }
    }

    public subscript(option key: ImageWand.Option) -> String? {
        get {
            guard let pointer = MagickGetOption(self.pointer, key.value) else {
                return nil
            }
            
            defer {
                MagickRelinquishMemory(pointer)
            }
            
            return String(cString: pointer)
        } set {            
            MagickSetOption(self.pointer, key.value, newValue)
        }
    }
}
