//
//  WelcomeFlow.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class WelcomeFlow {

    var didFinish: EmptyClosure?

    private let defaults: UserDefaults

    init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }

    func start(with viewController: UIViewController) {
        let welcomeVC: WelcomeVC = .init()
        viewController.present(welcomeVC, animated: true, completion: nil)
        welcomeVC.didTapGetStarted = {
            viewController.dismiss(animated: true, completion: nil)
            self.defaults.set(true, forKey: .hasFinishedWelcomeFlow)
            self.didFinish?()
        }
    }
}
