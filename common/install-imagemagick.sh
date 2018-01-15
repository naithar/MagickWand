#!/bin/sh

if [uname -s == "Linux" ]; then 
      apt-get update && \
      apt-get install -y build-essential \
            curl \
            cmake \
            zlib1g-dev \
            libtool \
            pkg-config
fi

cd ~ && mkdir imagemagick-install && cd ./imagemagick-install

echo "::::::::::::::::: LCMS"
curl -O -L https://downloads.sourceforge.net/lcms/lcms2-2.9.tar.gz
tar xzvf lcms2-2.9.tar.gz
cd lcms2-2.9
./configure --prefix=/usr/local --disable-static && make
make install
cd ./.. && rm -rf lcms2-2.9*

echo "::::::::::::::::: libexif"
curl -O -L https://downloads.sourceforge.net/libexif/libexif-0.6.21.tar.gz
tar zxvf libexif-0.6.21.tar.gz
cd libexif-0.6.21
./configure --prefix=/usr/local \
            --with-doc-dir=/usr/local/share/doc/libexif-0.6.21 \
            --disable-static && make
make install
cd ./.. && rm -rf libexif-0.6.21*

echo ":::::::::::::::: NASM"
curl -O -L  http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.gz
tar xvfz nasm-2.13.02.tar.gz
cd nasm-2.13.02
./configure --prefix=/usr/local && make
make install
cd ./.. && rm -rf nasm-2.13.02*

echo ":::::::::::::::: JPEG"
curl -O -L  https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.3.tar.gz
tar xvfz libjpeg-turbo-1.5.3.tar.gz
cd libjpeg-turbo-1.5.3
./configure --prefix=/usr/local           \
            --mandir=/usr/local/share/man \
            --with-jpeg8            \
            --disable-static        \
            --docdir=/usr/local/share/doc/libjpeg-turbo-1.5.3 && make
make install
cd ./.. && rm -rf libjpeg-turbo-1.5.3*

echo ":::::::::::::::: JASPER"
curl -O -L  http://www.ece.uvic.ca/~frodo/jasper/software/jasper-2.0.14.tar.gz
tar xvfz jasper-2.0.14.tar.gz
cd jasper-2.0.14
mkdir -p BUILD && \
cd    BUILD && \
cmake -DCMAKE_INSTALL_PREFIX=/usr/local    \
      -DCMAKE_BUILD_TYPE=Release     \
      -DCMAKE_SKIP_INSTALL_RPATH=YES \
      -DJAS_ENABLE_DOC=NO            \
      -DCMAKE_INSTALL_DOCDIR=/usr/local/share/doc/jasper-2.0.14 \
      ..  && make
make install
cd ./../.. && rm -rf jasper-2.0.14*

echo ":::::::::::: LibPNG"
curl -O -L  https://downloads.sourceforge.net/libpng/libpng-1.6.34.tar.gz
tar xvfz libpng-1.6.34.tar.gz
cd libpng-1.6.34
./configure --prefix=/usr/local --disable-static && make
make install
cd ./.. && rm -rf libpng-1.6.34*

echo ":::::::::::: libraw"
curl -O -L  http://www.libraw.org/data/LibRaw-0.18.6.tar.gz
tar xvfz LibRaw-0.18.6.tar.gz
cd LibRaw-0.18.6
./configure --prefix=/usr/local    \
            --enable-jpeg    \
            --enable-jasper  \
            --enable-lcms    \
            --disable-static \
            --docdir=/usr/local/share/doc/libraw-0.18.6 && make
make install
cd ./.. && rm -rf LibRaw-0.18.6*

echo ":::::::::::: LibTIFF"
curl -O -L  http://download.osgeo.org/libtiff/tiff-4.0.9.tar.gz
tar xvfz tiff-4.0.9.tar.gz
cd tiff-4.0.9
./configure --prefix=/usr/local && make
make install
cd ./.. && rm -rf tiff-4.0.9*

echo ":::::::::::: giflib"
curl -O -L https://downloads.sourceforge.net/giflib/giflib-5.1.4.tar.gz
tar xvfz giflib-5.1.4.tar.gz
cd giflib-5.1.4
./configure --prefix=/usr/local --disable-static && make
make install
cd ./.. && rm -rf giflib-5.1.4*

echo ":::::::::::: libwebp"
curl -O -L http://downloads.webmproject.org/releases/webp/libwebp-0.6.1.tar.gz
tar xvfz libwebp-0.6.1.tar.gz
cd libwebp-0.6.1
./configure --prefix=/usr/local           \
            --enable-libwebpmux     \
            --enable-libwebpdemux   \
            --enable-libwebpdecoder \
            --enable-libwebpextras  \
            --enable-swap-16bit-csp \
            --disable-static        && make
make install
cd ./.. && rm -rf libwebp-0.6.1*

echo ":::::::::::: OpenJPEG"
curl -O -L https://github.com/uclouvain/openjpeg/archive/v2.3.0/openjpeg-2.3.0.tar.gz
tar xvfz openjpeg-2.3.0.tar.gz
cd openjpeg-2.3.0
mkdir -p build && \
cd       build &&\
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local .. && make
make install
cd ./../.. && rm -rf openjpeg-2.3.0*

echo "::::::::::: FreeType"
curl -O -L https://downloads.sourceforge.net/freetype/freetype-2.9.tar.gz
tar zxvf freetype-2.9.tar.gz
cd freetype-2.9
./configure --prefix=/usr/local --disable-static && make
make install
cd ./.. && rm -rf freetype-2.9*

echo "::::::::::::::::: Ghostscript"
curl -O -L https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs922/ghostscript-9.22.tar.gz
tar zxvf ghostscript-9.22.tar.gz
cd ghostscript-9.22
rm -rf freetype lcms2 jpeg libpng zlib
./configure --prefix=/usr/local           \
            --disable-compile-inits \
            --enable-dynamic        \
            --with-system-libtiff   && make
make so
make install
make soinstall &&
install -v -m644 base/*.h /usr/local/include/ghostscript &&
ln -v -s ghostscript /usr/local/include/ps
cd ./.. && rm -rf ghostscript-9.22*

echo ":::::::::::::::: Ghostscript-fonts"
curl -O -L https://downloads.sourceforge.net/gs-fonts/ghostscript-fonts-std-8.11.tar.gz
tar zxvf ghostscript-fonts-std-8.11.tar.gz
mv fonts /usr/local/share/ghostscript
rm -rf ghostscript-fonts-std-8.11*

echo ":::::::::::::::: LibWMF"
curl -O -L http://downloads.sourceforge.net/sourceforge/wvware/libwmf-0.2.8.4.tar.gz
tar xzvf libwmf-0.2.8.4.tar.gz
cd libwmf-0.2.8.4
./configure --prefix=/usr/local       
make
make install
cd ./.. && rm -rf libwmf-0.2.8.4*

echo "::::::::::::::::: ImageMagick"
curl -O -L https://github.com/ImageMagick/ImageMagick/archive/6.9.9-33.tar.gz
tar xzvf 6.9.9-33.tar.gz
cd ImageMagick-6.9.9-33
./configure CPPFLAGS='-I/usr/include:/usr/local/include:/usr:/usr/local' LDFLAGS='-L/usr/lib:/usr/local/lib:/usr:/usr/local'   --prefix=/usr/local --disable-static  --with-modules --without-magick-plus-plus --without-perl --without-magick-plus-plus --with-png=yes --with-quantum-depth=16 --with-gs-font-dir=/usr/local/share/ghostscript/fonts --disable-openmp --with-gslib=yes
make
make install
cd ./.. && rm -rf 6.9.9-33* && rm -rf ImageMagick-*
