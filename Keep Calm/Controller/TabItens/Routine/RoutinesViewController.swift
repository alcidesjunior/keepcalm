//
//  RoutinesViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class RoutinesViewController: UIViewController, ControllerProtocol {
    
    var routine: Routine!
    var routineViewModel: RoutineViewModel!
    var routineView: RoutineView!
    
    override func loadView() {
        self.routine = Routine()
        self.routineViewModel = RoutineViewModel(routine: routine)
        self.routineView = RoutineView()
        self.routineView.setup(routineViewModel: routineViewModel)
        self.view = routineView
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let scheduleManager = ScheduleManager()
//        let results = scheduleManager.getAll()
//        print(results?.count)
//        results?.forEach({ (result) in
//            print(result.value(forKey: "activity") as! String)
//            print(result.value(forKey: "day") as! Int)
//        })
//        scheduleManager.deleteAll()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
    }
    
    func navbarSettings() {
        title = "Rotina"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        let buttonNewRoutine = UIBarButtonItem(title: "Criar", style: .done, target: self, action: #selector(newRoutine))
        buttonNewRoutine.tintColor = .white
        self.navigationItem.rightBarButtonItem  = buttonNewRoutine
    }
    
    @objc func newRoutine() {
        
        let newRoutine = NewRoutineViewController()
        self.navigationController?.pushViewController(newRoutine, animated: true)
    }

}
