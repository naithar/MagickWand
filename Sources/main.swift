import Foundation

MagickWand.genesis()

do {
    let wand = Wand()
    wand?.clear()

   let dataWand = Wand(data: Data())

    let cloned = wand?.clone()
wand?.resize()
    print(wand?.isMagickWand)
    print(wand)
}
print(MagickWand.isInstantiated)
print(MagickWand.version)
