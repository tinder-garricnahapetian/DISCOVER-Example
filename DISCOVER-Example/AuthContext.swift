//
//  AuthContext.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import Foundation

protocol CredentialProvider: class {
    typealias Username = String
    typealias Password = String
    var onDidProvide: ((Username, Password) -> Void)? { get set }
    func didProvideInvalidCredentials(error: Error)
}

class AuthContext {
    typealias Token = String
    var didFinish: ((Token) -> Void)?

    private let credentialProvider: CredentialProvider

    init(credentialProvider: CredentialProvider) {
        self.credentialProvider = credentialProvider
        setup()
    }

    private func setup() {
        credentialProvider.onDidProvide = { username, password in
            guard let username = Username.init(rawValue: username) else {
                return
            }

            guard let password = Password.init(rawValue: password) else {
                return
            }

            let credential = Credential.init(username: username, password: password)

            self.login(with: credential, completion: self.parseResult)
        }
    }

    private func login(with credentials: Credential, completion: (Result) -> Void) {
        // perform asyn code
        completion(.success(token: "successToken"))
    }

    private func parseResult(result: Result) {
        switch result {
        case .success(let token):
            didFinish?(token)
        case .failure(let error):
            credentialProvider.didProvideInvalidCredentials(error: error)
        }
    }
}

enum Result {
    case success(token: String)
    case failure(error: Error)
}

struct Credential {
    let username: Username
    let password: Password

}

struct Username {
    let rawValue: String
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
}

struct Password {
    let rawValue: String
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
