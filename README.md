# Swift MagickWand

[![Swift](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)](https://swift.org)
[![imagemagick](https://img.shields.io/badge/ImageMagick-6.9.6-orange.svg?style=flat)](https://www.imagemagick.org/script/index.php)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](/LICENSE)  
[![Build Status](https://travis-ci.org/naithar/MagickWand.svg?branch=master)](https://travis-ci.org/naithar/MagickWand)
[![codebeat badge](https://codebeat.co/badges/fad61ebd-809c-4a22-995d-5633e314f119)](https://codebeat.co/projects/github-com-naithar-magickwand)
[![Code Climate](https://codeclimate.com/github/naithar/MagickWand/badges/gpa.svg)](https://codeclimate.com/github/naithar/MagickWand)
[![codecov](https://codecov.io/gh/naithar/MagickWand/branch/master/graph/badge.svg)](https://codecov.io/gh/naithar/MagickWand)  
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)  
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange.svg?style=flat)  

This package supports 6.9.6 version of ImageMagick.


## Intallation

### Linux and Mac OSX

#### Install ImageMagick

```
curl -OL http://www.imagemagick.org/download/ImageMagick-6.9.6-5.tar.gz
tar -xzf ImageMagick-6.9.6-5.tar.gz
cd ImageMagick-6.9.6-5
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
```

You may also need to install dependencies for ImageMagick.  
Or run an [install-script.sh](common/install-imagemagick.sh) which also installs `ZLIB` dependency.

#### Add Package

Add this package to `dependencies` in your `Package.swift` file.

```
.Package(url: "https://github.com/naithar/MagickWand.git", majorVersion: 0, minor: 2)
```

## Building and Testing

### Linux and Mac OSX

```
swift build -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=8

swift test  -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=8
```
