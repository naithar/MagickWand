

MagickWand.genesis()

do {
    let wand = Wand()
    wand.clear()

    let dataWand = Wand(data: Data())

    let cloned = wand.clone()

    print(dataWand.isMagickWand)
    print(wand)
}
print(MagickWand.instantiated)
print(MagickWand.version)
