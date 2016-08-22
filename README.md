# Swift MagickWand

## Installing

### Linux

```
sudo apt-get install libmagickwand-dev imagemagick
```

### Mac OSX

```
brew install imagemagick
```

## Building

### Linux

```
swift build -Xcc -I/usr/include/ImageMagick
```

### Mac OSX

```
swift build -Xcc -I/usr/local/include/ImageMagick-6/ -Xlinker -L/usr/local/lib/
```
