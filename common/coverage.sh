if [[ "$(uname)" = "Darwin" ]]; then
    echo ">> Starting coverage generation with OSX build"
    xcodebuild -scheme MagickWand -project MagickWand.xcodeproj  -sdk macosx -configuration Release -enableCodeCoverage YES test build test
    bash <(curl -s https://codecov.io/bash) -t 9f79d408-2281-4004-b741-c3c66fe97c06
    echo ">> Finished coverage generation"
fi
