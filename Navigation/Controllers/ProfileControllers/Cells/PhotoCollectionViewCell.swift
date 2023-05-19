//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Владимир on 27.04.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
    //MARK: - UI elements
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        addSubviews()
        setupConstraints()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    //MARK: - public
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    //MARK: - private
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(imageView.image, frameImage: imageView.frame, indexPath: indexPathCell)
    }
    //MARK: - Layout
    
    private func addSubviews() {
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
