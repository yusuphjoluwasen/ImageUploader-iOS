//
//  ControllerView.swift
//  ImageUploaderExample
//
//  Created by Guru on 25/01/2022.
//

import UIKit
//MARK:- View
extension ViewController{
    
    func setUpConstraintsAndProperties(){
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(loaderView)
        loaderView.addSubview(loader)
        setUpConstraints()
        setUpProperties()
    }
    
    func setUpConstraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        loaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        loaderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        loaderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loader.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loader.widthAnchor.constraint(equalToConstant: 60).isActive = true

        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpProperties(){
        button.setUpHelperButton(title: "Fetch Image")
        imageView.setUpHelperImage(image: "userimmage", cornerRadius: 75)
        loaderView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        loaderView.isHidden = true
    }
}
