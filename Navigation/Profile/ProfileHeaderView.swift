//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владимир on 10.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
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
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 60
        image.backgroundColor = .clear
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.clipsToBounds = true
        image.image = UIImage(named: "dog")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - add UIelements
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(avatarImage)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
    }
//MARK: - layout
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            avatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 120),
            avatarImage.heightAnchor.constraint(equalToConstant: 120),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -64),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            statusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 36),
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: statusButton.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -12)
        ])
    }
}
