//
//  LogInViewController.swift
//  Navigation
//
//  Created by Владимир on 19.04.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - UI elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    let loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)

        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
        
        return textField
    }()
    
    @objc func textFieldShouldReturn() -> Bool {
        view.endEditing(true)
    }
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = CustomColor().hexStringToUIColor(hex: "#4885CC")
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
        if button.isSelected && button.isHighlighted {
            button.alpha = 0.8
        }
        return button
    }()
    
    @objc func pressLoginButton() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        initializeHideKeyboard()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(loginStackView)
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(loginButton)
    }
    
    private func setConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            loginStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leadingAnchor.constraint(equalTo: loginStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor)
        ])
    }
}
    //MARK: - Extension
private extension LogInViewController {
    @objc func keyboardWillShow(_ notification: Notification) {
           
           if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
               let keyboardRectangle = keyboardFrame.cgRectValue
               let keyboardHeight = keyboardRectangle.height
               let initButtonBottomY = self.loginButton.frame.origin.y + loginButton.frame.height
               let keyboardOriginY = self.view.frame.height - keyboardHeight
               let contentOffset = keyboardOriginY < initButtonBottomY ? initButtonBottomY - keyboardOriginY + 50 : 0
               
               self.scrollView.contentOffset = CGPoint(x: 0, y: contentOffset)
           }
       }
       
       @objc func keyboardWillHide(_ notification: Notification) {
           self.view.endEditing(true)
           self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
       }
    
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
