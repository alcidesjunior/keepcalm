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
        title = "Chás"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
    }

}
