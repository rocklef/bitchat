#!/bin/bash

# BitChat Run Script
# This script helps build and run BitChat on macOS

echo "Building BitChat for macOS..."

# Build the macOS version
xcodebuild -project bitchat.xcodeproj \
  -scheme "bitchat_macOS" \
  -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  build

if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # Find and run the app
    echo "Launching BitChat..."
    find ~/Library/Developer/Xcode/DerivedData -name "bitchat.app" -path "*/Debug/*" -not -path "*/Index.noindex/*" | head -1 | xargs -I {} open "{}"
else
    echo "Build failed. Please check the error messages above."
    exit 1
fi