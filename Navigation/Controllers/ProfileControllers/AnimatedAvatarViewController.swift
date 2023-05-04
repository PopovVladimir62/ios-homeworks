//
//  AnimatedAvatarViewController.swift
//  Navigation
//
//  Created by Владимир on 01.05.2023.
//

import UIKit

class AnimatedAvatarViewController: UIViewController {
    
    //MARK: - Avatar + DismissButton
    
    private var avatarImage: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.layer.cornerRadius = 60
        image.backgroundColor = .clear
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.image = UIImage(named: "dog")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()

    
    private var leadingAvatarConstraint = NSLayoutConstraint()
    private var topAvatarConstraint = NSLayoutConstraint()
    private var heightAvatarConstraint = NSLayoutConstraint()
    private var widthAvatarConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(avatarImage)
        view.addSubview(dismissButton)
    }

    private func setupConstrains() {
        leadingAvatarConstraint = avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        topAvatarConstraint = avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        heightAvatarConstraint = avatarImage.heightAnchor.constraint(equalToConstant: 120)
        widthAvatarConstraint = avatarImage.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([
        
        ])
    }
    
    
}
