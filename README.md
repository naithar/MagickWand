# Disclaimer

Project is currently under development.  
Some feature may not work as expected or may not work at all.  
Use at your own risk.

# Swift MagickWand

[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org)
[![imagemagick](https://img.shields.io/badge/ImageMagick-6.9.x-orange.svg?style=flat)](https://www.imagemagick.org/script/index.php)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](/LICENSE)  
[![Build Status](https://travis-ci.org/naithar/MagickWand.svg?branch=master)](https://travis-ci.org/naithar/MagickWand)
[![codebeat badge](https://codebeat.co/badges/fad61ebd-809c-4a22-995d-5633e314f119)](https://codebeat.co/projects/github-com-naithar-magickwand)
[![Code Climate](https://codeclimate.com/github/naithar/MagickWand/badges/gpa.svg)](https://codeclimate.com/github/naithar/MagickWand)
[![codecov](https://codecov.io/gh/naithar/MagickWand/branch/master/graph/badge.svg)](https://codecov.io/gh/naithar/MagickWand)  
![platforms](https://img.shields.io/badge/platform-macOS%20Linux-green.svg?style=flat)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)  

This package supports 6.9.x version of ImageMagick.


## Intallation

### Shared

It should be possible it install `MagickWand` with required dependencies using script at `/common/install-imagemagick.sh`

```
curl -O -L https://github.com/naithar/MagickWand/raw/master/common/install-imagemagick.sh
bash install-imagemagick.sh
```

### Mac OSX

```
brew install imagemagick@6
```

### Linux

##### Install Dependencies

```
sudo apt-get -y build-dep imagemagick
```

##### Install ImageMagick

```
curl -OL https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz
tar xf ImageMagick-6.9.6-8.tar.xz
cd ImageMagick-6.9.6-8
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
```

### Add Package

Add this package to `dependencies` in your `Package.swift` file.

```
.Package(url: "https://github.com/naithar/MagickWand.git", majorVersion: 0)
```

## Building and Testing

### Shared

```
eval $(echo 'swift build -Xlinker -L/usr/local/lib/' `Magick-config --cflags` | sed 's/\(-[DI]\)/-Xcc \1/g')

eval $(echo 'swift test -Xlinker -L/usr/local/lib/' `Magick-config --cflags` | sed 's/\(-[DI]\)/-Xcc \1/g')
```

### Mac OSX

```
swift build -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16

swift test -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16
```

### Linux

```
swift build -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16

swift test  -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16
```

## XCode Setup

Generate XCode project using:
```
swift package -Xswiftc -I/usr/local/opt/imagemagick@6/include/ImageMagick-6 -Xlinker -L/usr/local/opt/imagemagick@6/lib -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16 generate-xcodeproj
```
This will add required flags to the project settings.

If required add values manually to `Build Settings`:
- `-I/usr/local/opt/imagemagick@6/include/ImageMagick-6` value to `Other Swift Flags`.
- `-L/usr/local/opt/imagemagick@6/lib` value to `Other Linker Flags`.
