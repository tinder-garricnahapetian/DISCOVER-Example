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

    func start(with rootView: UIViewController) {
        let view = AuthVC()
        let context = AuthContext()
        view.didProvide = { username, password in
            context.authenticate(with: username, password) { result in
                switch result {
                case .success(let token):
                    rootView.dismiss(animated: true, completion: nil)
                    self.didFinish?(token)
                case .failure(let error):
                    view.didProvideInvalidCredentials(error: error)
                }
            }
        }
        rootView.present(view, animated: true, completion: nil)
    }
}
