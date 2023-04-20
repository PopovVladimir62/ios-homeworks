//
//  ViewController.swift
//  Navigation
//
//  Created by Владимир on 05.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: FeedViewController(),
                title: "User feed",
                image: UIImage(systemName: "info.bubble")),
            generateVC(
                viewController: ProfileViewController() ,
                title: "Profile",
                image: UIImage(systemName: "person.crop.circle"))
        ]
        tabBar.backgroundColor = .white

    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
    
}

