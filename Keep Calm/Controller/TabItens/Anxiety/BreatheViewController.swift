//
//  BreatheViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
class BreatheViewController: UIViewController, ControllerProtocol {
    
    var anxietyMovie: [AnxietyMovie]? = []
    var breathViewModel: AnxietyViewModel!
    let breatheView = BreatheView()
    
    override func loadView() {
        guard let movie = self.anxietyMovie?.first else { return }
        breathViewModel = AnxietyViewModel(anxietyMovie: movie)
        
        breatheView.setup(breatheViewModel: breathViewModel)
        self.view = breatheView
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        
    }
    
    func navbarSettings() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
    }

}
