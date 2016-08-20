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

	public static var instantiated: Bool {
		return IsMagickInstantiated().bool
	}

	public static var version: String {
		guard let pointer = MagickGetVersion(nil) else { return "unknown" }
		return String(cString: pointer)
	}
}

public class Wand {

	private var pointer: OpaquePointer
	deinit {
		print("deinit")
		DestroyMagickWand(self.pointer)
	}

	public init?() {
		guard let pointer = NewMagickWand() else { return nil }
		self.pointer = pointer
		print("created new")
	}

	public convenience init?(data: Data) {
		self.init()
				
	}

	public convenience init?(bytes: [UInt8]) {
		self.init()
	}
}
