//
//  AuthVC.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    var didProvide: ((_ username: String, _ password: String) -> Void)?

    private let authView: AuthView = .init()

    override func loadView() {
        view = authView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        authView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }

    @objc
    private func didTapLoginButton(sender: UIButton) {
        let username = authView.usernameTextField.text ?? ""
        let password = authView.passwordTextField.text ?? ""

        didProvide?(username, password)
        authView.didProvide()
    }

    func didProvideInvalidCredentials(error: Error) {
        authView.didProvideInvalidCredentials(error: error)
    }
}
