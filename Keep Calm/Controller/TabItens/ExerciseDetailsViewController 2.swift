//
//  ExerciseDetailsViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 06/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class ExerciseDetailsViewController: UIViewController, ControllerProtocol {
    
    var exerciseDetailsView: ExerciseDetailsView!
    var activity: Activity? = nil
    
    override func loadView() {
        self.exerciseDetailsView = ExerciseDetailsView()
        self.exerciseDetailsView.setup(activity: activity!)
        self.view = exerciseDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
    }
    
    func navbarSettings() {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
    }

}
