//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владимир on 26.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - Data
    
    private let twentyPhotos = DataForPhotoCell.makeTwentyPhotos()
    private var initialImageRect: CGRect = .zero
    
    //MARK: - collection view
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray3
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    //MARK: - UI for Collection animation
    
    private let transparentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0
        
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 210, width: 40, height: 40))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func crossButtonAction() {
        animateImageToInitial(rect: initialImageRect)
        crossButton.removeFromSuperview()
    }
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        addSubviews()
        setupConstraints()
        photoCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.navigationItem.title = "Photo gallery"
        self.tabBarController?.navigationItem.titleView?.tintColor = .black
    }
    //MARK: - Animated functions
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.transparentView.alpha = 0
            self.animatingImageView.frame = rect
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
            self.crossButton.alpha = 0
            self.transparentView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(transparentView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.transparentView.alpha = 0.5
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.alpha = 1
            }
        }
    }
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(photoCollectionView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}
    //MARK: - Extensions
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        twentyPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = UIImage(named: twentyPhotos[indexPath.item])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
    
    //MARK: - Configure collectionView
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func configureCollectionView() {
        view.backgroundColor = .systemGray6
        title = "Photo Gallery"
    }
}

extension PhotosViewController: CustomCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectItem = photoCollectionView.layoutAttributesForItem(at: indexPath)
        let rectInSuperView = photoCollectionView.convert(rectItem?.frame ?? .zero, to: photoCollectionView.superview)
        initialImageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
