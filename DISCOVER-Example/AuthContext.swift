//
//  AuthContext.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import Foundation

class AuthContext {
    typealias Token = String
    var didFinish: ((Token) -> Void)?

    enum AuthError: Swift.Error {
        case invalidUsername
        case invalidPassword
        case invalidCredential
    }

    func authenticate(with username: String, _ password: String, completion: @escaping (Result) -> Void) {
        guard let username = Username.init(rawValue: username) else {
            completion(.failure(error: AuthError.invalidUsername))
            return
        }

        guard let password = Password.init(rawValue: password) else {
            completion(.failure(error: AuthError.invalidPassword))
            return
        }

        guard let _ = Credential(username: username, password: password) else {
            completion(.failure(error: AuthError.invalidCredential))
            return
        }
        // perform async task
        completion(.success(token: "successToken"))
    }
}

enum Result {
    case success(token: String)
    case failure(error: Error)
}

struct Credential {
    let username: Username
    let password: Password
    init?(username: Username, password: Password) {
        // perform local validation
        self.username = username
        self.password = password
    }
}

struct Username {
    let rawValue: String
    init?(rawValue: String) {
        // perform local validation
        self.rawValue = rawValue
    }
}

struct Password {
    let rawValue: String
    init?(rawValue: String) {
        // perform local validation
        self.rawValue = rawValue
    }
}
