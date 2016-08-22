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

public struct MagickWand {

	public static func genesis() {
		MagickWandGenesis()
	}

	public static func terminus() {
		MagickWandTerminus()
	}

	public static var isInstantiated: Bool {
	#if os(Linux)
		return IsMagickInstantiated().bool
	#else
		return IsMagickWandInstantiated().bool
	#endif
	}

	public static var version: String {
		guard let pointer = MagickGetVersion(nil) else { return "unknown" }
		return String(cString: pointer)
	}
}



public class Wand {

	public typealias Size = (width: Int, height: Int)

	public enum Filter {
		case blackman
		case box
		case catrom
		case gaussian
		case hanning
		case hermite
		case lanczos
		case mitchell
		case sinc
		case triangle
		case kaiser
		case sentinel
		case welsh

		var filter: FilterTypes {
			switch self {
                	case .blackman:
				return BlackmanFilter
                	case .box:
				return BoxFilter
                	case .catrom:
				return CatromFilter
                	case .gaussian:
				return GaussianFilter
                	case .hanning:
				return HanningFilter
                	case .hermite:
				return HermiteFilter
                	case .lanczos:
				return LanczosFilter
                	case .mitchell:
				return MitchellFilter
                       	case .sinc:
				return SincFilter
                	case .triangle:
				return TriangleFilter
			case .kaiser:
				return KaiserFilter
			case .sentinel:
				return SentinelFilter
			case .welsh:
				return WelshFilter
			}
		}
	}

	private var pointer: OpaquePointer

	public var isMagickWand: Bool {
		return IsMagickWand(self.pointer).bool
	}

	public var imageBytes: [UInt8] {
		var size: Int = 0
        	guard let imageBlob = MagickGetImageBlob(self.pointer, &size) else { return [] }
        	var result = [UInt8](repeating: 0, count: size)
        	for i in 0..<size {
            		result[i] = imageBlob[i]
        	}

        	return result
	}

	public var data: Data {
		let array = self.imageBytes
		return Data(bytes: array)
	}

	public var size: Size {
		let (width, height) = (
			Int(MagickGetImageWidth(self.pointer)),
			Int(MagickGetImageHeight(self.pointer))
		)

		// MagickGetSize(self.pointer, &width, &height)

		return (width, height)
	}

	public func size(for dimention: Int) -> Size {
		let size = self.size
		var result = (width: 0, height: 0)

		if size.width == 0
			|| size.height == 0 {
				return (0, 0)
		}

		let ratio = Double(size.height) / Double(size.width)

		if ratio > 1 {
			result.height = dimention
			result.width = Int(Double(result.height) / ratio)
		} else if ratio < 1 {
			result.width = dimention
			result.height = Int(ratio * Double(result.width))
		} else {
			result.width = dimention
			result.height = dimention
		}

		return result
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

	public convenience init?<T>(bytes: UnsafePointer<T>, length: Int) {
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

	public func clone() -> Wand? {
		guard let pointer = CloneMagickWand(self.pointer) else { return nil }
		return Wand(pointer: pointer)
	}

	public func read(data: Data) {
		let length = data.count
		let bytes = UnsafeMutablePointer<UInt8>.allocate(capacity: length)

		data.copyBytes(to: bytes, count: length)

		self.read(bytes: bytes, length: length)

		bytes.deallocate(capacity: length)
	}

	public func read<T>(bytes: UnsafePointer<T>, length: Int) {
		let bytes = UnsafePointer<UInt8>(bytes)

		let bufferPointer = UnsafeBufferPointer(start: bytes, count: length)
		let array = Array(bufferPointer)

		self.read(bytes: array)
	}

	public func read(bytes: [UInt8]) {
		MagickReadImageBlob(self.pointer, bytes, bytes.count)
	}

	public func resize(width: Int, height: Int, filter: Filter, blur: Double = 1.0) {
		MagickResizeImage(self.pointer, width, height, filter.filter, blur)
	}

	public func adaptiveResize(width: Int, height: Int) {
		MagickAdaptiveResizeImage(self.pointer, width, height)
	}

	public func scale(width: Int, height: Int) {
		MagickScaleImage(self.pointer, width, height)
	}
}
