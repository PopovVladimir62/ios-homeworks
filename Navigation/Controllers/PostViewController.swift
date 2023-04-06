//
//  PostViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var somePost = Post(title: "My post!")
    let buttonPost = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configButton()

    }
    
    func configButton() {
        view.addSubview(buttonPost)
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        buttonPost.backgroundColor = CustomColor().hexStringToUIColor(hex: "009FBD")
        buttonPost.setTitle("Show modal screen", for: .normal)
        buttonPost.titleLabel?.font = UIFont(name: "Show modal screen", size: 20)
        buttonPost.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            buttonPost.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonPost.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            buttonPost.widthAnchor.constraint(equalToConstant: 150),
            buttonPost.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        buttonPost.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    func setupView() {
        self.navigationItem.title = somePost.title
        self.view.backgroundColor = CustomColor().hexStringToUIColor(hex: "C0DBEA")
    }

    @objc private func onTap() {
        let someVC = ModalViewController()
        let navVC = UINavigationController(rootViewController: someVC)
        present(navVC, animated: true)
    }
}

