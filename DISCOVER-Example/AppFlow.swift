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

class AppFlow {

    let rootViewController: AppVC = .init()

    private lazy var welcomeFlow = WelcomeFlow()
    private lazy var authFlow = AuthFlow()
    private lazy var sessionFlow = SessionFlow()

    func start(with context: AppContext) {
        switch context.state {
        case .welcome:
            startWelcomeFlow()
        case .auth:
            startAuthFlow()
        case .session(let token):
            startSessionFlow(withToken: token)
        }
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

    private func startSessionFlow(withToken token: String) {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        rootViewController.present(vc, animated: true, completion: nil)
    }
}
