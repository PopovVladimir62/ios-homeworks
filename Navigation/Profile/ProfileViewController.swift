//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myProfileHeaderView = ProfileHeaderView()
    private var topLayout = [NSLayoutConstraint]()
    private var bottomLayout = [NSLayoutConstraint]()
    private var isLayoutOnTop = true
    
//MARK: - button for replace myProfileHeaderView
    
    private lazy var moveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Move profile", for: .normal)
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
        isLayoutOnTop.toggle()
        viewWillLayoutSubviews()
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
        view.addSubview(moveButton)
        setupMyProfileHeaderView()
        setupLayout()
        initializeHideKeyboard()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        isLayoutOnTop ? activateTopLayout() : activateBottomLayout()
    }
    
    func setupMyProfileHeaderView() {
        view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(myProfileHeaderView)
        myProfileHeaderView.translatesAutoresizingMaskIntoConstraints = false
    }
//MARK: - layuot
    func setupLayout() {
        topLayout = [
            myProfileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            myProfileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myProfileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myProfileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        bottomLayout = [
            myProfileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            myProfileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myProfileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myProfileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }

    private func activateBottomLayout() {
        NSLayoutConstraint.deactivate(topLayout)
        NSLayoutConstraint.activate(bottomLayout)
    }
    
    private func activateTopLayout() {
        NSLayoutConstraint.deactivate(bottomLayout)
        NSLayoutConstraint.activate(topLayout)
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
