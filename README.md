# Swift MagickWand

## Installing

### Linux and Mac OSX

```
curl -OL http://www.imagemagick.org/download/ImageMagick-6.9.6-5.tar.gz
tar -xzf ImageMagick-6.9.6-5.tar.gz
cd ImageMagick-6.9.6-5
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
```

## Building

### Linux

```
swift build -Xcc -I/usr/include/ImageMagick
```

### Mac OSX

```
swift build -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16

swift test  -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16
```
