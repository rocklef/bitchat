# Running BitChat Using Cloud-Based Mac Services

This guide explains how to run BitChat using cloud-based macOS services since the application is designed for Apple platforms and cannot run natively on Windows.

## Option 1: GitHub Actions (Automated Building)

I've created a GitHub Actions workflow that automatically builds BitChat for both macOS and iOS. To use this:

1. Push your code to a GitHub repository
2. The workflow will automatically trigger on pushes to the main branch
3. View build results in the Actions tab of your repository

The workflow builds both the macOS and iOS versions without code signing, which is perfect for testing.

## Option 2: MacInCloud (Dedicated macOS Environment)

MacInCloud provides dedicated macOS virtual machines in the cloud:

1. Sign up at [MacInCloud.com](https://www.macincloud.com/)
2. Choose a plan with macOS and Xcode
3. Connect via Remote Desktop to your macOS instance
4. Clone and run the project:

```bash
# Clone the repository
git clone <your-repository-url>
cd bitchat

# Open in Xcode
open bitchat.xcodeproj

# Or build from command line
xcodebuild -project bitchat.xcodeproj \
  -scheme "bitchat_macOS" \
  -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO \
  build
```

## Option 3: GitHub Codespaces with Manual Setup

While GitHub Codespaces typically runs on Linux, you can try to set up a development environment:

1. Create a new Codespace for your repository
2. Install necessary tools manually (this may have limitations)

Note: Building iOS/macOS apps in Codespaces may not work due to platform limitations.

## Running the Application

After building, you can run the application on:

### macOS
```bash
# Find and run the built app
find ~/Library/Developer/Xcode/DerivedData -name "bitchat.app" -path "*/Debug/*" -not -path "*/Index.noindex/*" | head -1 | xargs -I {} open "{}"
```

There's also a helper script [run.sh](file:///c%3A/Users/ASUS/off-chat/bitchat/run.sh) included in the repository that automates this process. On macOS, you can make it executable and run it:
```bash
chmod +x run.sh
./run.sh
```

### iOS Simulator
The iOS version will run in the iOS Simulator that comes with Xcode.

## What BitChat Does

BitChat is a decentralized peer-to-peer messaging app with:

- **Dual Transport Architecture**: Local Bluetooth mesh networks for offline communication and internet-based Nostr protocol for global reach
- **No Accounts Required**: No phone numbers or central servers needed
- **Privacy First**: End-to-end encryption with the Noise Protocol
- **Location-Based Channels**: Geographic chat rooms using geohash coordinates
- **Offline Communication**: Works completely offline using Bluetooth mesh networking

## Troubleshooting

If you encounter issues:

1. Make sure Xcode command line tools are installed: `xcode-select --install`
2. Verify you're using the correct scheme names: "bitchat_macOS" or "bitchat_iOS"
3. Ensure code signing is disabled for testing builds
4. Check that all dependencies are properly linked

For the best experience, we recommend using MacInCloud or a physical Mac since BitChat is specifically designed for Apple's ecosystem.