//
//  AppDelegate.swift
//  Dework
//
//  Created by Vinicius Mangueira on 10/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let constructor = Constructor()
        window = constructor.window
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {}
}

