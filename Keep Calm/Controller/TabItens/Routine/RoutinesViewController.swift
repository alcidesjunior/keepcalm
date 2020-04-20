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
    var isSelecting: Bool = false
    var buttonEditRoutine: UIBarButtonItem!
    var activitiesToRemove: [String] = []
    private var cell: RoutineDayCollectionViewCell!
    private var transform: CGAffineTransform!
    
    override func loadView() {
        self.routine = Routine()
        self.routineViewModel = RoutineViewModel(routine: routine)
        self.routineView = RoutineView()
        self.routineView.setup(routineViewModel: routineViewModel)
        self.view = routineView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let results = scheduleManager.getAll()
        self.buttonEditRoutine.isEnabled = false
        if results!.count > 0 {
            routineView.routineContent.isHidden = false
            routineView.routineEmpty.removeFromSuperview()//isHidden = true
            self.buttonEditRoutine.isEnabled = true
        }
//        scheduleManager.deleteAll()
        settingCollections()
        seedCollections()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
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
    
    func resetCells() {
        self.loadView()
        self.viewWillAppear(true)
    }
    
    func settingCollections() {
        routineView.monCollection.delegate = self
        routineView.monCollection.dataSource = self
//        routineView.monCollection.visibleCells
        
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
    
    fileprivate func navButtons() {
        self.buttonEditRoutine = UIBarButtonItem(title: "Editar", style: .done, target: self, action: #selector(editRoutineAction))
        self.buttonEditRoutine.tintColor = .white
        self.navigationItem.leftBarButtonItem  = self.buttonEditRoutine
        
        let buttonNewRoutine = UIBarButtonItem(title: "Criar", style: .done, target: self, action: #selector(newRoutineAction))
        buttonNewRoutine.tintColor = .white
        self.navigationItem.rightBarButtonItem  = buttonNewRoutine
    }
    
    func navbarSettings() {
        title = "Rotina"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
        navButtons()
        
    }
    
    fileprivate func deleteActivities() {
        self.activitiesToRemove.forEach { (activity) in
            self.scheduleManager.delete(id: activity) { (response) in}
        }
        self.activitiesToRemove.removeAll()
        self.resetCells()
    }
    
    fileprivate func deleteActivitiesAlert() {
        
        let alert = UIAlertController(title: "Atenção", message: "Deseja remover atividades?", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "Sim", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
            self.deleteActivities()
        })
        let no = UIAlertAction(title: "Não", style: UIAlertAction.Style.destructive, handler: {(alert: UIAlertAction!) in
            self.resetCells()
            self.activitiesToRemove.removeAll()
        })
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
    }
    
    //EDIT/DELETE ACTIONS
    @objc func editRoutineAction(){
        self.isSelecting = !self.isSelecting
        if self.isSelecting {
            self.buttonEditRoutine.title = "Cancelar"
            self.buttonEditRoutine.tintColor = GlobalSettings.Colors.NavColors.secondaryAction
            collectionsReloadData()
        }else {
            self.buttonEditRoutine.title = "Editar"
            self.buttonEditRoutine.tintColor = GlobalSettings.Colors.NavColors.primaryAction
            if activitiesToRemove.count > 0 {
                deleteActivitiesAlert()
            }else {
                collectionsReloadData()
            }
        }
        
    }
    
    @objc func newRoutineAction() {
        
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
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        case routineView.tueCollection:
            let cell = routineView.tueCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: tuesday![indexPath.item]?.value(forKey: "activity") as! String, hour: tuesday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        case routineView.wedCollection:
            let cell = routineView.wedCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: wednesday![indexPath.item]?.value(forKey: "activity") as! String, hour: wednesday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        case routineView.thuCollection:
            let cell = routineView.thuCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: thursday![indexPath.item]?.value(forKey: "activity") as! String, hour: thursday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        case routineView.friCollection:
            let cell = routineView.friCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: friday![indexPath.item]?.value(forKey: "activity") as! String, hour: friday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        case routineView.satCollection:
            let cell = routineView.satCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: saturday![indexPath.item]?.value(forKey: "activity") as! String, hour: saturday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        default:
            let cell = routineView.sunCollection.dequeueReusableCell(withReuseIdentifier: routineView.cellID, for: indexPath) as!  RoutineDayCollectionViewCell
            cell.setup(activityDesc: sunday![indexPath.item]?.value(forKey: "activity") as! String, hour: sunday![indexPath.item]?.value(forKey: "hour") as! String)
            if isSelecting {
                cell.shakeIcons()
            }else {
                cell.stopShakingIcons()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let routineDetails = RoutineDetailsViewController()
        var routineData:NSManagedObject
        //self.newRoutineView.daysCollection.cellForItem(at: indexPath) as!
        
        switch collectionView {
        case routineView.monCollection:
            routineData = monday![indexPath.item]!
            cell = self.routineView.monCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        case routineView.tueCollection:
            routineData = tuesday![indexPath.item]!
            cell = self.routineView.tueCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        case routineView.wedCollection:
            routineData = wednesday![indexPath.item]!
            cell = self.routineView.wedCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        case routineView.thuCollection:
            routineData = thursday![indexPath.item]!
            cell = self.routineView.thuCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        case routineView.friCollection:
            routineData = friday![indexPath.item]!
            cell = self.routineView.friCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        case routineView.satCollection:
            routineData = saturday![indexPath.item]!
            cell = self.routineView.satCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        default:
            routineData = sunday![indexPath.item]!
            cell = self.routineView.sunCollection.cellForItem(at: indexPath) as? RoutineDayCollectionViewCell
        }
        
        if !isSelecting {
            routineDetails.routineDetails = routineData
            self.navigationController?.pushViewController(routineDetails, animated: true)
            
        }else {
            
            if cell.dayView.backgroundColor != .lightGray {
                cell.dayView.backgroundColor = .lightGray
                guard let _id = routineData.value(forKey: "id") as? String else {return}
                activitiesToRemove.append(_id)
            }else {
                cell.dayView.backgroundColor = .clear
                activitiesToRemove.removeAll { (id) -> Bool in
                    id == routineData.value(forKey: "id") as! String
                }
            }
            
            if activitiesToRemove.count > 0 {
                self.buttonEditRoutine.title = "Deletar"
            }else {
                self.buttonEditRoutine.title = "Cancelar"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = 120
        
        let heigth = 60

        return CGSize(width: width, height: heigth)
    }
    
    
}
