//
//  AppContext.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class AppContext {

    enum State {
        case welcome
        case auth
        case session(String)
    }

    private(set) lazy var state: State = {
        return determineAppState()
    }()

    private let application: UIApplication
    private let launchOptions: LaunchOptions
    private let launchReason: LaunchReason

    private var hasFinishedWelcomeFlow: Bool {
        return UserDefaults.standard.bool(forKey: .hasFinishedWelcomeFlow)
    }

    init(application: UIApplication, launchOptions: LaunchOptions) {
        self.application = application
        self.launchOptions = launchOptions
        self.launchReason = LaunchReason(launchOptions: launchOptions)
    }

    private func determineAppState() -> State {
        switch launchReason {
        case .normal:
            if hasFinishedWelcomeFlow {
                return .auth
            } else {
                return .welcome
            }
        }
    }
}

extension String {
    static let hasFinishedWelcomeFlow = "hasFinishedWelcomeFlow"
}
