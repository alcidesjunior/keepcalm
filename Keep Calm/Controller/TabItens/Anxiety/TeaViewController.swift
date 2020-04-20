//
//  TeaViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class TeaViewController: UIViewController, ControllerProtocol {
    
    var anxietyMovie: [AnxietyMovie]? = []
    let teaView = TeaView()
    var anxieties: [AnxietyViewModel] = []

    override func loadView() {
        guard let movies = self.anxietyMovie else { return }
        
        movies.forEach { (movie) in
            anxieties.append(AnxietyViewModel(anxietyMovie: movie))
        }
        
        teaView.setup(anxietyViewModel: anxieties)
        self.view = teaView
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navbarSettings()
        // Do any additional setup after loading the view.
    }
    
    func navbarSettings() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
        self.navigationController?.navigationBar.tintColor = .white
    }

}
