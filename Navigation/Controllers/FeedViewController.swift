//
//  UserFeedController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var somePost = Post(title: "My post!")
    
//MARK: - stackview with buttons
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.firstFeedButton)
        stackView.addArrangedSubview(self.secondFeedButton)
        
        return stackView
    }()
    
//MARK: - buttons
    
    private lazy var firstFeedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "9A208C")
        button.setTitle("See my post", for: .normal)
        button.titleLabel?.font = UIFont(name: "See my post", size: 20)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondFeedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "9A208C")
        button.setTitle("See my post", for: .normal)
        button.titleLabel?.font = UIFont(name: "See my post", size: 20)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func pressButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

//MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.backgroundColor = CustomColor().hexStringToUIColor(hex: "DCA7AC")
        setupLayout()
    }
    
//MARK: - layout
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

