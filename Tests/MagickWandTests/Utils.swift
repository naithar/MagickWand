//
//  Utils.swift
//  MagickWand
//
//  Created by Sergey Minakov on 19.01.17.
//
//

import Foundation

func open(file: String, ofType type: String) -> Data? {
    var fileData: Data?
    #if os(Linux)
        fileData = try? Data(contentsOf: URL(fileURLWithPath: "\(file).\(type)"))
    #else
        if let path = Bundle(for: MagickWandTests.self).path(forResource: file, ofType: type) {
            fileData = try? Data(contentsOf: URL(fileURLWithPath: path))
        } else {
            fileData = try? Data(contentsOf: URL(fileURLWithPath: "\(file).\(type)"))
        }
    #endif
    
    return fileData
}
