if [[ "$(uname)" = "Darwin" ]]; then
    echo ">> Starting coverage generation with OSX build"
    swift package -Xlinker -L/usr/local/lib/ -Xcc -DMAGICKCORE_HDRI_ENABLE=0 -Xcc -DMAGICKCORE_QUANTUM_DEPTH=16 -Xswiftc -I/usr/local/include/ImageMagick-6 -Xcc -I/usr/local/include/ImageMagick-6 generate-xcodeproj
    xcodebuild -scheme MagickWand-Package -project MagickWand.xcodeproj  -sdk macosx -configuration Release -enableCodeCoverage YES test build test
    bash <(curl -s https://codecov.io/bash)
    echo ">> Finished coverage generation"
fi
