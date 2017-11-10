//
//  AppDelegate.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/9/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    private let appFlow: AppFlow = .init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: LaunchOptions) -> Bool {
        window?.rootViewController = appFlow.rootViewController
        window?.makeKeyAndVisible()
        appFlow.start(with: AppContext(launchOptions: launchOptions))
        return true
    }
}
