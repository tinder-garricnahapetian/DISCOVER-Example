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

    func start(with viewController: UIViewController) {
        let welcomeVC: WelcomeVC = .init()
        viewController.present(welcomeVC, animated: true, completion: nil)
        welcomeVC.didTapGetStarted = {
            UserDefaults.standard.set(true, forKey: .hasFinishedWelcomeFlow)
            viewController.dismiss(animated: true, completion: nil)
            self.didFinish?()
        }
    }
}
