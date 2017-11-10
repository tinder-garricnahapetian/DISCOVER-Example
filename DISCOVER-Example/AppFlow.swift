//
//  AppFlow.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class AppFlow {

    let rootViewController = LaunchVC()

    private lazy var authFlow = AuthFlow()

    func start(with context: AppContext) {
        switch context.state {
        case .auth:
            startAuthFlow()
        case .session(let token):
            startSessionFlow(withToken: token)
        default:
            break
        }
    }

    private func startAuthFlow() {
        authFlow.start(with: rootViewController)
        authFlow.didFinish = { token in
            self.startSessionFlow(withToken: token)
        }
    }

    private func startSessionFlow(withToken token: String) {
        let vc = UIViewController.init()
        vc.view.backgroundColor = .green
        rootViewController.present(vc, animated: true, completion: nil)
    }
}
