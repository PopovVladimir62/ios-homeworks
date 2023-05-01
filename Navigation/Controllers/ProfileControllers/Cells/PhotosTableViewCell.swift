//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Владимир on 26.04.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.right")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        
        return image
    }()
    
    private lazy var firstPhotoImageView: UIImageView = {
        makePhotoImageView()
    }()
    
    private lazy var secondPhotoImageView: UIImageView = {
        makePhotoImageView()
    }()
    
    private lazy var thirdPhotoImageView: UIImageView = {
        makePhotoImageView()
    }()
    
    private lazy var fourthPhotoImageView: UIImageView = {
        makePhotoImageView()
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public func
    
    func setupCell(model: DataForPhotoCell) {
        firstPhotoImageView.image = UIImage(named: model.firstPhoto)
        secondPhotoImageView.image = UIImage(named: model.secondPhoto)
        thirdPhotoImageView.image = UIImage(named: model.thirdPhoto)
        fourthPhotoImageView.image = UIImage(named: model.fourthPhoto)
    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        [titleLabel, arrowImage, firstPhotoImageView, secondPhotoImageView, thirdPhotoImageView, fourthPhotoImageView].forEach{ contentView.addSubview($0)}
    }
    
    private func setupConstraints() {
        let screenSize: CGRect = UIScreen.main.bounds
        let sideOfPhoto: CGFloat = (screenSize.width - Metric.edgeInset * 2 - Metric.insetBetweenImage * 3) / 4
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.edgeInset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.edgeInset),
            
            arrowImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: Metric.edgeInset),
            arrowImage.widthAnchor.constraint(equalToConstant: Metric.edgeInset),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.edgeInset),
            
            firstPhotoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metric.edgeInset),
            firstPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.edgeInset),
            firstPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.edgeInset),
            firstPhotoImageView.widthAnchor.constraint(equalToConstant: sideOfPhoto),
            firstPhotoImageView.heightAnchor.constraint(equalToConstant: sideOfPhoto),
            
            secondPhotoImageView.leadingAnchor.constraint(equalTo: firstPhotoImageView.trailingAnchor, constant: Metric.insetBetweenImage),
            secondPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.edgeInset),
            secondPhotoImageView.widthAnchor.constraint(equalToConstant: sideOfPhoto),
            secondPhotoImageView.heightAnchor.constraint(equalToConstant: sideOfPhoto),
            secondPhotoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metric.edgeInset),
            
            thirdPhotoImageView.leadingAnchor.constraint(equalTo: secondPhotoImageView.trailingAnchor, constant: Metric.insetBetweenImage),
            thirdPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.edgeInset),
            thirdPhotoImageView.widthAnchor.constraint(equalToConstant: sideOfPhoto),
            thirdPhotoImageView.heightAnchor.constraint(equalToConstant: sideOfPhoto),
            thirdPhotoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metric.edgeInset),
            
            fourthPhotoImageView.leadingAnchor.constraint(equalTo: thirdPhotoImageView.trailingAnchor, constant: Metric.edgeInset),
            fourthPhotoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.edgeInset),
            fourthPhotoImageView.widthAnchor.constraint(equalToConstant: sideOfPhoto),
            fourthPhotoImageView.heightAnchor.constraint(equalToConstant: sideOfPhoto),
            fourthPhotoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metric.edgeInset)
            
        ])
    }
}



