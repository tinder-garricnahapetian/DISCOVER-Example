//
//  AuthFlow.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class AuthFlow {

    var didFinish: ((String) -> Void)?

    private let context: AuthContext

    init(context: AuthContext = .init()) {
        self.context = context
    }

    func start(with rootView: UIViewController) {
        let view = AuthVC()
        rootView.present(view, animated: true, completion: nil)
        view.didProvide = { username, password in
            self.context.authenticate(with: username, password) { result in
                switch result {
                case .success(let token):
                    view.dismiss(animated: true, completion: nil)
                    self.didFinish?(token)
                case .failure(let error):
                    view.didProvideInvalidCredentials(error: error)
                }
            }
        }
    }
}
