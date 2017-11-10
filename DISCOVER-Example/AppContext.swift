//
//  AppContext.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplicationLaunchOptionsKey: Any]?

class AppContext {

    enum State {
        case none
        case auth
        case onboarding // onboarding before session? what about onboarding after session? what about new feature tours?
        case whatsNew
        case session(String)
    }

    private(set) var state: State = .none
    private let launchReason: LaunchReason

    init(launchOptions: LaunchOptions) {
        self.launchReason = LaunchReason.init(launchOptions: launchOptions)
        self.state = .auth
    }
}

enum LaunchReason {
    case normal
    case location

    init(launchOptions: LaunchOptions) {
        self = .normal
    }
}
