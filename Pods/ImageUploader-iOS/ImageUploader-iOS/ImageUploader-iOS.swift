//
//  ImageUploader.swift
//  ImageUploader-iOS
//
//  Created by Guru on 22/01/2022.
//

import Foundation
import AWSCognito
import UIKit

public class ImageUploader{
    
    public static let shared = ImageUploader()
    
    private var accessKey = ""
    private var secretKey = ""
    private var region:AWSRegionType?
    
    public func setAWSCredentials(accessKey:String, secretKey:String, region:AWSRegionType){
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.region = region
    }
    
    public func initializeS3() {
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)
        let configuration = AWSServiceConfiguration(region: region ?? .USEast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }
    
    public func provideBucketName(bucketName:String){
        AWSS3Manager.shared.provideBucketName(bucketName)
    }
    
    public func uploadImage(image:UIImage, fileName:String, progressaction: @escaping (_ imageString:Double)->Void, completedaction: @escaping (_ imageString:String)->Void){
        
        AWSS3Manager.shared.uploadImage(image: image, fileName: fileName, progress: { progress in
            
            progressaction(progress)
            print("progress \(progress)")
            
        }, completion: { response,error in
            if response != nil{
                completedaction(response as! String)
            }else{
                completedaction("")
            }
            
            print("Completed with \(String(describing: response)) \(String(describing: error?.localizedDescription))")
            
        })
    }
    
    public func pickImage(controller:UIViewController, imagePicker:inout ImagePicker?){
        imagePicker = ImagePicker(presentationController: controller, delegate: controller as! ImagePickerDelegate)
        imagePicker?.present(from: controller.view)
    }
}
