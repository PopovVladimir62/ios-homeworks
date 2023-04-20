//
//  UserFeedController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var somePost = Post(title: "My post!")
    
    lazy var feedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "9A208C")
        button.setTitle("See my post", for: .normal)
        button.titleLabel?.font = UIFont(name: "See my post", size: 20)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor().hexStringToUIColor(hex: "DCA7AC")
        view.addSubview(feedButton)
        configurationButtonConstraints()
    }
    
    func configurationButtonConstraints() {
        NSLayoutConstraint.activate([
            feedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            feedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            feedButton.widthAnchor.constraint(equalToConstant: 150),
            feedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func onTap() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

}

