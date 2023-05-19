//
//  ModalViewController.swift
//  Navigation
//
//  Created by Владимир on 18.05.2023.
//

import UIKit

class ModalViewController: UIViewController {
    
    var isLiked: Bool?
    
    //MARK: - UI elements
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.preferredMaxLayoutWidth = label.frame.size.width
        
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = label.frame.size.width
        
        return label
    }()
    
    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        
        
        return imageView
    }()
    
    private lazy var likesAndViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        
        return stackView
    }()
    
    private var viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.text = "Likes: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }

    //MARK: - Private
    private func setupSubviews() {
        likesAndViewsStackView.addArrangedSubview(viewLabel)
        likesAndViewsStackView.addArrangedSubview(likesLabel)
        
        view.addSubview(authorLabel)
        view.addSubview(postImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(likesAndViewsStackView)
    }
    //MARK: - public
    
    func setupData(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewLabel.text = "Views: \(model.views)"
        isLiked = model.isLiked
        if isLiked == true {
            likesLabel.text = " ♥ Likes: \(model.likes)"
            likesLabel.textColor = .red
        } else {
            likesLabel.text = "Likes: \(model.likes)"
            likesLabel.textColor = .black
        }
        view.backgroundColor = .white
    }
    //MARK: - layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            likesAndViewsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesAndViewsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likesAndViewsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

