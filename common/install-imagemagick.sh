echo ">> Installing ZLIB"

curl -OL https://www.imagemagick.org/download/delegates/zlib-1.2.8.tar.gz
tar xf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/usr/local
make
sudo make install
cd ..
rm -rf zlib-1.2.8*

echo ">> Installing ImageMagick 6.9.6-8"

curl -OL https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz
tar xf ImageMagick-6.9.6-8.tar.xz
cd ImageMagick-6.9.6-8
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
cd ..
rm -rf ImageMagick-6.9.6-8*
