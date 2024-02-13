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
@objc private func fetchImage() {
    ImageUploader.shared.pickImage(controller: self, imagePicker: &imagePicker)
}

//MARK:- Image Picker
extension ViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        imageView.image = image
        imageView.layer.masksToBounds = true
        ImageUploader.shared.provideBucketName(bucketName: "bucket-name")
        ImageUploader.shared.uploadImage(image: image, fileName: "imagename.png", progressaction: { [weak self] progress in
            // Show any loader or progress of your choice
            self?.showLoader()
        }, completedaction: { [weak self] imageString in
            self?.hideLoader()
            // Do something with the uploaded image string
            // For example, send the image URL to the backend
        })
    }
}
```

## Requirements

- iOS 11.0+
- Xcode 12.0+
- Swift 5.0+

## License

The ImageUploader-iOS CocoaPods library is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Example App

The repository also contains an example app demonstrating the usage of the library.
