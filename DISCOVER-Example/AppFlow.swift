//
//  AppFlow.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplicationLaunchOptionsKey: Any]?
typealias EmptyClosure = (() -> Void)
typealias Token = String

class AppFlow {

    let context: AppContext
    let window: UIWindow

    private var rootViewController: UIViewController {
        return window.rootViewController!
    }

    private lazy var welcomeFlow = WelcomeFlow()
    private lazy var authFlow = AuthFlow()
    private lazy var sessionFlow = SessionFlow()

    init(context: AppContext, window: UIWindow?) {
        self.context = context
        self.window = window ?? .init()
    }

    func didFinishLaunching() -> Bool {
        window.rootViewController = AppVC()
        window.makeKeyAndVisible()
        return didStartSubFlow()
    }

    private func didStartSubFlow() -> Bool {
        switch context.state {
        case .welcome:
            startWelcomeFlow()
        case .auth:
            startAuthFlow()
        case .session(let token):
            startSessionFlow(withToken: token)
        }
        return true
    }

    private func startWelcomeFlow() {
        welcomeFlow.start(with: rootViewController)
        welcomeFlow.didFinish = {
            self.startAuthFlow()
        }
    }

    private func startAuthFlow() {
        authFlow.start(with: rootViewController)
        authFlow.didFinish = { token in
            self.startSessionFlow(withToken: token)
        }
    }

    private func startSessionFlow(withToken token: Token) {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        rootViewController.present(vc, animated: true, completion: nil)
    }
}
