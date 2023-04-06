//
//  ModalViewController.swift
//  Navigation
//
//  Created by Владимир on 06.04.2023.
//

import UIKit

class ModalViewController: UIViewController {
    
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    func assignbackground(){
        
        let imageName = "mem"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
    }
}
