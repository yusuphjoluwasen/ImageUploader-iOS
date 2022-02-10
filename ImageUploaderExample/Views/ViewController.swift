//
//  ViewController.swift
//  ImageUploaderExample
//
//  Created by Guru on 22/01/2022.
//

import UIKit
import ImageUploader_iOS

class ViewController: UIViewController {
    
    let button = UIButton(type: .system)
    private let tapGestureRecognizer = UITapGestureRecognizer()
    let imageView = UIImageView()
    private var imagePicker:ImagePicker?
    let loader = SpinnerView()
    let loaderView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpConstraintsAndProperties()
        clickButtonToPickImage()
    }
   
    func showLoader(){
        loaderView.isHidden = false
    }
    
    func hideLoader(){
        loaderView.isHidden = true
    }
    
    //MARK:Actions
    private func clickButtonToPickImage(){
        button.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(fetchImage))
    }
    
    @objc private func fetchImage(){
        ImageUploader.shared.pickImage(controller: self, imagePicker: &imagePicker)
    }
    
    func updateImageProperties(image:UIImage){
        imageView.image = image
        imageView.layer.masksToBounds = true
    }
}

//MARK:- Image Picker
extension ViewController:ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        updateImageProperties(image: image)
        ImageUploader.shared.provideBucketName(bucketName: "bucket-name")
        ImageUploader.shared.uploadImage(image: image, fileName: "imagename.png", progressaction: { [weak self] progress in
            //show any loader or progress of your choice
            self?.showLoader()
        }, completedaction: { [weak self] imageString in
            self?.hideLoader()
            //do something with the uploaded image string e.g send the image url to the backend
        })
    }
}


