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
    
    private var warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textColor = .red
        label.text = "Password is too short!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
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
        loginTextField.backgroundColor = .systemGray6
        return view.endEditing(true)
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
        // MARK: DELETE NEXT 2 String
//        let profileViewController = ProfileViewController()
//        navigationController?.pushViewController(profileViewController, animated: true)
        if loginTextField.text?.count ?? 0 < 1{
            loginTextField.backgroundColor = CustomColor().hexStringToUIColor(hex: "EA5455")
            loginTextField.shake()
            loginTextField.placeholder = "The field must be filled in"
            return
        } else if !loginTextField.text!.isValidEmail() {
            loginTextField.backgroundColor = CustomColor().hexStringToUIColor(hex: "EA5455")
            loginTextField.shake()
            return
        } else if passwordTextField.text?.count ?? 0 < 5 {
            passwordTextField.backgroundColor = CustomColor().hexStringToUIColor(hex: "EA5455")
            passwordTextField.shake()
            warningLabel.isHidden = false
            return
        } else if loginTextField.text == "admin@mail.ru" && passwordTextField.text == "12345" {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Error!", message: "Incorrect login or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try again", style: .default))
            self.present(alert, animated: true)
            loginTextField.text = nil
            passwordTextField.text = nil
            passwordTextField.backgroundColor = .systemGray6
            warningLabel.isHidden = true
        }
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loginTextField.text = nil
        loginTextField.placeholder = "Email or phone"
        passwordTextField.text = nil
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .systemGray6
        warningLabel.isHidden = true
        
    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(loginStackView)
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(warningLabel)
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
            loginButton.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor),
            
            warningLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            warningLabel.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor)
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
