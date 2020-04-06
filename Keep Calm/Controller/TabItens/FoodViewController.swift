//
//  FoodViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, ControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
    }

    func navbarSettings() {
        title = "Alimentação"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
    }
}
