import Foundation

#if os(Linux)
import CMagickWandLinux
#else
import CMagickWandOSX
#endif

extension MagickBooleanType {

	var bool: Bool {
		return self.rawValue == 1
	}
}

enum WandFilter {
	case lanczos

	var filter: FilterType {
		switch self {
		default:
			return LanczosFilter
		}
	}
}

public struct MagickWand {

	public static func genesis() {
		MagickWandGenesis()
	}

	public static func terminus() {
		MagickWandTerminus()
	}

	public static var isInstantiated: Bool {
		return IsMagickInstantiated().bool
	}

	public static var version: String {
		guard let pointer = MagickGetVersion(nil) else { return "unknown" }
		return String(cString: pointer)
	}
}

public class Wand {

	private var pointer: OpaquePointer

	public var isMagickWand: Bool {
		return IsMagickWand(self.pointer).bool
	}

	public var imageBytes: [UInt8] {
		var size: Int = 0
        let imageBlob = MagickWriteImageBlob(wand, &size)
        var result = [UInt8](count: size, repeatedValue: 0)
        for i in 0..<size {
            result[i] = imageBlob[i]
        }

        return result
	}

	public var data: Data {
		let array = self.imageBytes
		return Data(bytes: array, length: array.count)
	}

	deinit {
		print("deinit")
		DestroyMagickWand(self.pointer)
	}

	public init?() {
		guard let pointer = NewMagickWand() else { return nil }
		self.pointer = pointer
		print("created new")
	}

	private init(pointer: OpaquePointer) {
		self.pointer = pointer
	}

	public convenience init?(data: Data) {
		self.init()

		self.read(data: data)
	}

	public convenience init?(bytes: UnsafePointer<T>, length: Int) {
		self.init()

		self.read(bytes: bytes, length: length)
	}

	public convenience init?(bytes: [UInt8]) {
		self.init()

		self.read(bytes: bytes)
	}

	public func clear() {
		ClearMagickWand(self.pointer)
	}

	public func clone() -> Wand {
		return Wand(pointer: pointer)
	}

	public func read(data: Data) {
		let bytes = data.bytes
		let length = data.length

		self.read(bytes: bytes, length: length)
	}

	public func read(bytes: UnsafePointer<T>, length: Int) {
		let bytes = UnsafePointer<UInt8>(bytes)

		let bufferPointer = UnsafeBufferPointer(bytes)
		let array = Array(bufferPointer)

		self.read(bytes: array)
	}

	public func read(bytes: [UInt8]) {
		MagickReadImageBlob(self.pointer, bytes, bytes.count)
	}

	public func resize() {

	}
}
