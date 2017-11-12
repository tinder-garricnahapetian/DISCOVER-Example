//
//  WelcomeVC.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/11/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    var didTapGetStarted: EmptyClosure?

    private let label: UILabel = .init()
    private let button: UIButton = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(label)
        label.text = "Welcome"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(button)
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc
    private func didTapButton(sender: UIButton) {
        didTapGetStarted?()
    }
}
