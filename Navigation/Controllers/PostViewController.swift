//
//  PostViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class PostViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressButton))
        navigationItem.rightBarButtonItem = barButton
    }

    func setupView() {
        self.navigationItem.title = FeedViewController().somePost.title
        self.view.backgroundColor = CustomColor().hexStringToUIColor(hex: "C0DBEA")
    }

    @objc private func pressButton() {
        let someVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: someVC)
        present(navVC, animated: true)
    }
}

