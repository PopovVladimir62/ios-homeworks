//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владимир on 10.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    var widthAvatarConstraint = NSLayoutConstraint()
    var heightAvatarConstraint = NSLayoutConstraint()
    var topAvatarConstraint = NSLayoutConstraint()
    var leadingAvatarConstraint = NSLayoutConstraint()
    //Transparent view
    var widthTVConstraint = NSLayoutConstraint()
    var heightTVConstraint = NSLayoutConstraint()
    var topTVConstraint = NSLayoutConstraint()
    var leadingTVConstraint = NSLayoutConstraint()
    
    //MARK: - Name label
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Twitter SEO"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    //MARK: - Status label
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "you're fired!"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    //MARK: - user avatar
    
    private var avatarImage: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.layer.cornerRadius = 60
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.image = UIImage(named: "dog")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private var transparentView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark.circle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .black
        button.isHidden = true
        button.alpha = 0
        button.addTarget(self, action: #selector(backAnimation), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - button to set status
    
    lazy private var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .blue
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
        statusLabel.text = statusTextField.text
        print("\(statusTextField.text ?? "")")
        statusTextField.text = ""
        if statusLabel.text == "" {
            statusTextField.shake()
            statusLabel.text = "you're fired!"
        }
    }
    //MARK: - textfield to write the status
    
    lazy private var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "enter your status"
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
        
        return textField
    }()
    
    @objc func textFieldShouldReturn() -> Bool {
        endEditing(true)
    }
    
    //MARK: - initialisation
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - add UI elements
    
    private func setupHierarchy() {
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
        addSubview(transparentView)
        addSubview(dismissButton)
        transparentView.addSubview(avatarImage)
    }
    //MARK: - layout
    
    func setupLayout(){
        
        widthAvatarConstraint = avatarImage.widthAnchor.constraint(equalToConstant: 120)
        heightAvatarConstraint = avatarImage.heightAnchor.constraint(equalToConstant: 120)
        topAvatarConstraint = avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        leadingAvatarConstraint = avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        
        widthTVConstraint = transparentView.widthAnchor.constraint(equalToConstant: 120)
        heightTVConstraint = transparentView.heightAnchor.constraint(equalToConstant: 120)
        topTVConstraint = transparentView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        leadingTVConstraint = transparentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            widthTVConstraint,
            heightTVConstraint,
            leadingTVConstraint,
            topTVConstraint,
            
            dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dismissButton.widthAnchor.constraint(equalToConstant: 20),
            dismissButton.heightAnchor.constraint(equalToConstant: 20),
            
            topAvatarConstraint,
            leadingAvatarConstraint,
            heightAvatarConstraint,
            widthAvatarConstraint,
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            statusButton.topAnchor.constraint(equalTo: topAnchor, constant: 172),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusButton.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -12)
        ])
    }
    
    //MARK: - Gesture
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToAnimate))
        transparentView.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Animation
    
    @objc private func goToAnimate() {
        self.statusButton.isEnabled = false
        self.statusTextField.isEnabled = false
        
        self.leadingTVConstraint.constant = 0
        self.topTVConstraint.constant = 0
        self.widthTVConstraint.constant = UIScreen.main.bounds.width
        self.heightTVConstraint.constant = UIScreen.main.bounds.height
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5) {
            
            self.topAvatarConstraint.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 2
            self.leadingAvatarConstraint.constant = 0
            self.heightAvatarConstraint.constant = UIScreen.main.bounds.width
            self.widthAvatarConstraint.constant = UIScreen.main.bounds.width
            self.avatarImage.layer.cornerRadius = 0
            

            self.transparentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)

            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.dismissButton.isHidden = false
                self.dismissButton.alpha = 1
            }
        }
    }
    
    @objc private func backAnimation() {
        self.statusButton.isEnabled = true
        self.statusTextField.isEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.dismissButton.alpha = 0
            
        } completion: { _ in
            self.dismissButton.isHidden = true
            
            UIView.animate(withDuration: 0.5) {
                self.transparentView.backgroundColor = UIColor.white.withAlphaComponent(0)

                self.widthAvatarConstraint.constant = 120
                self.heightAvatarConstraint.constant = 120
                self.leadingAvatarConstraint.constant = 16
                self.topAvatarConstraint.constant = 16
                self.avatarImage.layer.cornerRadius = 60
                
                self.layoutIfNeeded()
            } completion: { _ in
                self.widthTVConstraint.constant = 120
                self.heightTVConstraint.constant = 120
                self.leadingTVConstraint.constant = 16
                self.topTVConstraint.constant = 16
            }
        }
    }
}

