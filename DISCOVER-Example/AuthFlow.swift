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

    var context: AuthContext?

    func start(with rootViewController: UIViewController) {
        let authVC = AuthVC()
        context = AuthContext.init(credentialProvider: authVC)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            rootViewController.present(authVC, animated: true, completion: nil)
        }

        context?.didFinish = { token in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                rootViewController.dismiss(animated: true, completion: nil)
                self.didFinish?(token)
            }
        }
    }
}
