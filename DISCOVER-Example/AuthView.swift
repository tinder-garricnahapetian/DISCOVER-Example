//
//  AuthView.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/11/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class AuthView: UIView {

    let errorLabel: UILabel = .init()
    let usernameTextField: UITextField = .init()
    let passwordTextField: UITextField = .init()
    let loginButton: UIButton = .init()
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .white
        addSubview(errorLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(spinner)

        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        spinner.translatesAutoresizingMaskIntoConstraints = false

        errorLabel.bottomAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -10).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        usernameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"

        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .blue

        spinner.hidesWhenStopped = true
    }

    func didProvide() {
        errorLabel.text = nil
        usernameTextField.isHidden = true
        passwordTextField.isHidden = true
        loginButton.isHidden = true

        spinner.startAnimating()
        spinner.isHidden = false
    }

    func didProvideInvalidCredentials(error: Error) {
        errorLabel.text = error.localizedDescription
        usernameTextField.isHidden = false
        passwordTextField.isHidden = false
        loginButton.isHidden = false

        spinner.stopAnimating()
    }
}
