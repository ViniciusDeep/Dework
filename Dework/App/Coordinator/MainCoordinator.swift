//
//  Constructor.swift
//  Dework
//
//  Created by Vinicius Mangueira on 10/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableConstructor {
    mutating func setupConstructor()
}

struct Constructor: ConfigurableConstructor {
    var window: UIWindow?
    
    init() {
        setupConstructor()
    }
    
    mutating func setupConstructor() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: ListWorksController())
        navigation.navigationBar.isTranslucent = false
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
