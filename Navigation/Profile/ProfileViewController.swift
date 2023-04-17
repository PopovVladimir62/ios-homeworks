//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myProfileHeaderView = ProfileHeaderView()
    
    //MARK: - button
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("new action", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tapButton() {
        //future code here
    }
    //MARK: - fill in top area in Profile title
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newButton)
        setupMyProfileHeaderView()
        setupLayout()
        initializeHideKeyboard()
    }
    
    func setupMyProfileHeaderView() {
        view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(myProfileHeaderView)
        myProfileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - layout
    func setupLayout() {
        NSLayoutConstraint.activate([
            myProfileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            myProfileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myProfileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myProfileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
//MARK: - add tap on screen to hide Keyboard

extension ProfileViewController {
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}
