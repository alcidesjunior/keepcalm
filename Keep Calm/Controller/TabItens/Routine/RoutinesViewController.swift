//
//  RoutinesViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import CoreData

class RoutinesViewController: UIViewController, ControllerProtocol {
    
    var routine: Routine!
    var routineViewModel: RoutineViewModel!
    var routineView: RoutineView!
    let scheduleManager = ScheduleManager()
    var monday: [NSManagedObject?]? = nil
    var tuesday: [NSManagedObject?]? = nil
    var wednesday: [NSManagedObject?]? = nil
    var thursday: [NSManagedObject?]? = nil
    var friday: [NSManagedObject?]? = nil
    var saturday: [NSManagedObject?]? = nil
    var sunday: [NSManagedObject?]? = nil
    
    override func loadView() {
        self.routine = Routine()
        self.routineViewModel = RoutineViewModel(routine: routine)
        self.routineView = RoutineView()
        self.routineView.setup(routineViewModel: routineViewModel)
        self.view = routineView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let results = scheduleManager.getAll()
        if results!.count > 0 {
            routineView.routineContent.isHidden = false
            routineView.routineEmpty.removeFromSuperview()//isHidden = true
        }
//        scheduleManager.deleteAll()
        settingCollections()
        seedCollections()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
    }
    
    func seedCollections() {
        
        resetDays()
        settingDays()
        collectionsReloadData()
    }
    
    func resetDays() {
        
        monday?.removeAll()
        tuesday?.removeAll()
        wednesday?.removeAll()
        thursday?.removeAll()
        friday?.removeAll()
        saturday?.removeAll()
        sunday?.removeAll()
    }
    
    func settingDays() {
        
        monday = scheduleManager.getData(byDay: 0)
        tuesday = scheduleManager.getData(byDay: 1)
        wednesday = scheduleManager.getData(byDay: 2)
        thursday = scheduleManager.getData(byDay: 3)
        friday = scheduleManager.getData(byDay: 4)
        saturday = scheduleManager.getData(byDay: 5)
        sunday = scheduleManager.getData(byDay: 6)
    }
    
    func collectionsReloadData() {
        
        routineView.monCollection.reloadData()
        routineView.tueCollection.reloadData()
        routineView.wedCollection.reloadData()
        routineView.thuCollection.reloadData()
        routineView.friCollection.reloadData()
        routineView.satCollection.reloadData()
        routineView.sunCollection.reloadData()
    }
    
    func settingCollections() {
        routineView.monCollection.delegate = self
        routineView.monCollection.dataSource = self
        
        routineView.tueCollection.delegate = self
        routineView.tueCollection.dataSource = self
        
        routineView.wedCollection.delegate = self
        routineView.wedCollection.dataSource = self
        
        routineView.thuCollection.delegate = self
        routineView.thuCollection.dataSource = self
        
        routineView.friCollection.delegate = self
        routineView.friCollection.dataSource = self
        
        routineView.satCollection.delegate = self
        routineView.satCollection.dataSource = self
        
        routineView.sunCollection.delegate = self
        routineView.sunCollection.dataSource = self
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

extension RoutinesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case routineView.monCollection:
            return monday?.count ?? 0
        case routineView.tueCollection:
            return tuesday?.count ?? 0
        case routineView.wedCollection:
            return wednesday?.count ?? 0
        case routineView.thuCollection:
            return thursday?.count ?? 0
        case routineView.friCollection:
            return friday?.count ?? 0
        case routineView.satCollection:
            return saturday?.count ?? 0
        default:
            return sunday?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case routineView.monCollection:
            let cell = routineView.monCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: monday![indexPath.item]?.value(forKey: "activity") as! String, hour: monday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        case routineView.tueCollection:
            let cell = routineView.tueCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: tuesday![indexPath.item]?.value(forKey: "activity") as! String, hour: tuesday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        case routineView.wedCollection:
            let cell = routineView.wedCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: wednesday![indexPath.item]?.value(forKey: "activity") as! String, hour: wednesday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        case routineView.thuCollection:
            let cell = routineView.thuCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: thursday![indexPath.item]?.value(forKey: "activity") as! String, hour: thursday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        case routineView.friCollection:
            let cell = routineView.friCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: friday![indexPath.item]?.value(forKey: "activity") as! String, hour: friday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        case routineView.satCollection:
            let cell = routineView.satCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: saturday![indexPath.item]?.value(forKey: "activity") as! String, hour: saturday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        default:
            let cell = routineView.sunCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: sunday![indexPath.item]?.value(forKey: "activity") as! String, hour: sunday![indexPath.item]?.value(forKey: "hour") as! String)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let routineDetails = RoutineDetailsViewController()
        var routineData:NSManagedObject
        
        switch collectionView {
        case routineView.monCollection:
            routineData = monday![indexPath.item]!
        case routineView.tueCollection:
            routineData = tuesday![indexPath.item]!
        case routineView.wedCollection:
            routineData = wednesday![indexPath.item]!
        case routineView.thuCollection:
            routineData = thursday![indexPath.item]!
        case routineView.friCollection:
            routineData = friday![indexPath.item]!
        case routineView.satCollection:
            routineData = saturday![indexPath.item]!
        default:
            routineData = sunday![indexPath.item]!
        }
        
        routineDetails.routineDetails = routineData
        self.navigationController?.pushViewController(routineDetails, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = 120
        
        let heigth = 60

        return CGSize(width: width, height: heigth)
    }
    
    
}
