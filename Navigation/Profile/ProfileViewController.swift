//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myProfileHeaderView = ProfileHeaderView()
    
//MARK: - fill in top area in Profile title
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myProfileHeaderView)
        title = "Profile"
        view.backgroundColor = .lightGray
        initializeHideKeyboard()
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        myProfileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
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
