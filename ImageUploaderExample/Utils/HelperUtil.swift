//
//  HelperUtil.swift
//  ImageUploaderExample
//
//  Created by Guru on 24/01/2022.
//

import Foundation
import UIKit

extension UIButton{
    
    func setUpHelperButton(cornerRadius:CGFloat = 10, title:String = "", bgColor:UIColor = .darkGray, titleColor:UIColor = .white, color:UIColor = UIColor(white: 1.0, alpha: 0.4), font:UIFont = .boldSystemFont(ofSize: 15)){
        
        self.layer.cornerRadius = cornerRadius
        self.setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(color, for: .focused)
        self.titleLabel?.font = font
    }
}

extension UIImageView{
    func setUpHelperImage(image:String, cornerRadius:CGFloat = 30, contentMode:UIView.ContentMode = .scaleToFill){
        
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        self.layer.cornerRadius = cornerRadius
    }
}
