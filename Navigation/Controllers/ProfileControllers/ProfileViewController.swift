//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController, IncreaseLikeDelegate {

    
    //MARK: - Data
    
    let fourPhoto = DataForPhotoCell.makeArray()
    
    //MARK: - UI elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Layout
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCell(model: fourPhoto[indexPath.row])
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: posts[indexPath.row])
            cell.delegate = self
            cell.setIndexPath(indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
                navigationController?.pushViewController(PhotosViewController(), animated: true)
            } else if indexPath.section == 1 {
                posts[indexPath.row].views += 1
                let modalVC = ModalViewController()
                modalVC.setupData(model: posts[indexPath.row])
                tableView.reloadData()
                present(modalVC, animated: true)
            }
        }
}

//MARK: -  IncreaseLikeDelegate

extension ProfileViewController {
    func increaseLikes(for model: inout[Post], indexPath: IndexPath, cell: PostTableViewCell) {
        if cell.isLiked == false {
            model[indexPath.row].likes += 1
            cell.isLiked.toggle()
        } else {
            model[indexPath.row].likes -= 1
            cell.isLiked.toggle()
        }
    }
}

