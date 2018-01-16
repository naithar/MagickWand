//
//  Utils.swift
//  MagickWand
//
//  Created by Sergey Minakov on 19.01.17.
//
//

import Foundation

internal enum Utils {
    
    static func path(filePath: String = #file) -> String {
        let path = filePath.components(separatedBy: "/").dropLast(3).joined(separator: "/")
        return path
    }
    
    static func delete(fileName: String, filePath: String = #file) {
        let path = filePath.components(separatedBy: "/").dropLast(3).joined(separator: "/")
        let url = URL(fileURLWithPath: "\(path)/\(fileName)")
        try? FileManager.default.removeItem(at: url)
    }
    
    static func save(fileName: String, data: Data, filePath: String = #file) -> Bool {
        do {
            let path = filePath.components(separatedBy: "/").dropLast(3).joined(separator: "/")
            let url = URL(fileURLWithPath: "\(path)/\(fileName)")
            try data.write(to: url)
            return true
        } catch {
            return false
        }
    }
    
    static func open(file: String, ofType type: String, filePath: String = #file) -> Data? {
        var fileData: Data?
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: "\(file).\(type)")) {
            fileData = data
        } else {
            let path = filePath.components(separatedBy: "/").dropLast(3).joined(separator: "/")
            fileData = try? Data(contentsOf: URL(fileURLWithPath: "\(path)/\(file).\(type)"))
        }
        
        return fileData
    }
}
