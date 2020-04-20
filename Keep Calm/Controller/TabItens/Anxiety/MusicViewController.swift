//
//  MusicViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, ControllerProtocol {
    
    var anxietyMovie: [AnxietyMovie]? = []
    let musicsView = MusicsView()
    var anxieties: [AnxietyViewModel] = []
    
    override func loadView() {
        guard let movies = self.anxietyMovie else { return }
        
        movies.forEach { (movie) in
            anxieties.append(AnxietyViewModel(anxietyMovie: movie))
        }
        
        musicsView.setup(anxietyViewModel: anxieties)
        self.view = musicsView
        self.view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navbarSettings()
    }
    
    func navbarSettings() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
        self.navigationController?.navigationBar.tintColor = .white
    }
}
