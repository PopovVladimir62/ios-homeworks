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
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Impact", size: 30)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        viewControllers = [
            generateVC(
                viewController: UINavigationController(rootViewController: ProfileViewController()) ,
                title: "Profile",
                image: UIImage(systemName: "person.crop.circle")),
            generateVC(
                viewController: UINavigationController(rootViewController: UserFeedController()),
                title: "User feed",
                image: UIImage(systemName: "info.bubble"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height),
            cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .fill
        
        roundLayer.fillColor = CustomColor().hexStringToUIColor(hex: "FDF4F5").cgColor
        tabBar.tintColor = .purple
        tabBar.unselectedItemTintColor = CustomColor().hexStringToUIColor(hex: "BA90C6")
        
    }
}

