//
//  ViewController.swift
//  ImageUploaderExample
//
//  Created by Guru on 22/01/2022.
//

import UIKit
import ImageUploader_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ImageUploader.getImageUploader()
    }


}

