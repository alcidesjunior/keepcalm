//
//  RoutineDetailsViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 18/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import CoreData

class RoutineDetailsViewController: UIViewController, ControllerProtocol {
    
    var routineDetails: NSManagedObject!
    fileprivate let detailsRoutineView = RoutineDetailsView()
    
    override func loadView() {
        self.detailsRoutineView.setup(routine: routineDetails)
        self.view = detailsRoutineView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navbarSettings()
    }
    
    func navbarSettings() {
        title = "Detalhes"
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
        self.navigationController?.navigationBar.tintColor = .white
    }

}
