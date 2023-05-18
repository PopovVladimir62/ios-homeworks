//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Владимир on 20.04.2023.
//

import UIKit

protocol IncreaseLikeDelegate: AnyObject {
    func increaseLikes(for model: inout[Post], indexPath: IndexPath)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: IncreaseLikeDelegate?
    private var indexPathCell = IndexPath()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        descriptionLabel.text = nil
        postImageView.image = nil
        viewLabel.text = nil
        likesLabel.text = nil
    }
    
    //MARK: - Public
    func setupCell(model: Post) {
        authorLabel.text = model.author
        postImageView.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewLabel.text = "Views: \(model.views)"
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    //MARK: - Private
    private func setupSubviews() {
        likesAndViewsStackView.addArrangedSubview(viewLabel)
        likesAndViewsStackView.addArrangedSubview(likesLabel)
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesAndViewsStackView)
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addLike))
        likesLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func addLike() {
        delegate?.increaseLikes(for: &posts, indexPath: indexPathCell)
        likesLabel.text = "Likes: " + String(posts[indexPathCell.row].likes)
    }
    
    //MARK: - layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            likesAndViewsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesAndViewsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesAndViewsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            likesAndViewsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

