//
//  UserFeedController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var somePost = Post(title: "My post!")
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().hexStringToUIColor(hex: "DCA7AC")
        configurationButton()
    }
    
    func configurationButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "9A208C")
        button.setTitle("See my post", for: .normal)
        button.titleLabel?.font = UIFont(name: "See my post", size: 20)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }

    @objc private func onTap() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

}

