# ImageUploader-iOS

## Overview

The ImageUploader-iOS CocoaPods library is designed to provide developers with an easy-to-use solution for fetching images from a user's device and uploading images to an AWS S3 bucket. With just a few lines of code, developers can integrate this functionality into their iOS applications, allowing users to seamlessly manage and share images.

## Features

- Fetch images from the user's device.
- Upload images to an AWS S3 bucket.
- Easy integration with just a few lines of code.
- Built-in Swift for modern iOS development.

## Installation

### CocoaPods

To integrate the ImageUploader-iOS SDK into your Xcode project using CocoaPods, simply add the following line to your Podfile:

```ruby
pod 'ImageUploader-iOS'
```

Then, run the following command:

```bash
$ pod install
```

## Usage

1. Import the ImageUploader-iOS SDK module wherever you need it:

```swift
import ImageUploader_iOS
```

2. Initialize the SDK with your AWS S3 credentials:

```swift
let imageUploader = ImageUploader(accessKey: "YOUR_AWS_ACCESS_KEY", secretKey: "YOUR_AWS_SECRET_KEY", bucketName: "YOUR_AWS_BUCKET_NAME")
```

3. Fetch images from the user's device:

```swift
imageUploader.fetchImageFromDevice { result in
    switch result {
    case .success(let image):
        // Handle fetched image
    case .failure(let error):
        // Handle error
    }
}
```

4. Upload images to AWS S3:

```swift
imageUploader.uploadImageToAWS(image: image) { result in
    switch result {
    case .success(let url):
        // Handle uploaded image URL
    case .failure(let error):
        // Handle error
    }
}
```

## Requirements

- iOS 11.0+
- Xcode 12.0+
- Swift 5.0+

## License

The ImageUploader-iOS CocoaPods library is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

