//
//  LaunchVC.swift
//  DISCOVER-Example
//
//  Created by Garric Nahapetian on 11/10/17.
//  Copyright © 2017 Tinder Inc. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {

    private let spinner = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
