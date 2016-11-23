if [[ "$(uname)" = "Darwin" ]]; then
    echo ">> Starting coverage generation with OSX build"
    xcodebuild -scheme MagickWand -project MagickWand.xcodeproj  -sdk macosx -configuration Release -enableCodeCoverage YES test build test
    bash <(curl -s https://codecov.io/bash)
    echo ">> Finished coverage generation"
fi
