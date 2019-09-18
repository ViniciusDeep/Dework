//
//  CustomTabBarController.swift
//  Dework
//
//  Created by Vinicius Mangueira on 15/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
    
    fileprivate func setupTab() {
        tabBar.barTintColor = .primaryColor
  tabBar.tintColor = .backgroundColor
        tabBar.isTranslucent = true
        viewControllers = [createNavigation(viewController: ListWorksController(), title: "DeWork", imageNamed: "tab1"),  createNavigation(viewController: ListFavoriteController(), title: "Favorites", imageNamed: "star")]
    }
    
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.navigationController?.navigationBar.barTintColor = .primaryColor
        viewController.view.backgroundColor = .backgroundColor
        viewController.navigationItem.title = title
        navigation.navigationBar.isTranslucent = false
        navigation.tabBarItem.image = UIImage(named: imageNamed)
        navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "foreground") ?? .backgroundColor]
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "foreground") ?? .backgroundColor]
        return navigation
    }
}
