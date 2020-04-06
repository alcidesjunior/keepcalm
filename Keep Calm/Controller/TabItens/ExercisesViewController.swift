//
//  ExercisesViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, ControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
    }
    
    func navbarSettings() {
        title = "Exercícios"
    }

}
