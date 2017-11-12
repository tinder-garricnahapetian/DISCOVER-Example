//
//  LaunchReason.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/11/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//


enum LaunchReason {
    case normal

    init(launchOptions: LaunchOptions) {
        guard let options = launchOptions else {
            self = .normal
            return
        }
        fatalError("Need to implement non-nil launch options: \(options)")
    }
}
