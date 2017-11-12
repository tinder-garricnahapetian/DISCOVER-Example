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

    private let launchReason: LaunchReason

    private var hasFinishedWelcomeFlow: Bool {
        return UserDefaults.standard.bool(forKey: .hasFinishedWelcomeFlow)
    }

    init(launchOptions: LaunchOptions) {
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
