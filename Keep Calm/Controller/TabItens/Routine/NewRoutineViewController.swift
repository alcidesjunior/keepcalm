//
//  NewRoutineViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 16/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class NewRoutineViewController: UIViewController, ControllerProtocol {
    
    let newRoutineView = NewRoutineView()
    var daysSelected: [Int] = []
    let picker = UIPickerView()
    let toolBar = UIToolbar()
    let hours = Array(0...23)
    let minutes = Array(0...59)
    var currentHour = "00"
    var currentMinute = "00"
    var currentTime = "00:00"

    override func loadView() {
        self.view = newRoutineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navbarSettings()
        newRoutineView.daysCollection.delegate = self
        newRoutineView.daysCollection.dataSource = self
        newRoutineView.activityTF.delegate = self
        newRoutineView.hourTF.delegate = self
        newRoutineView.descriptionTextView.delegate = self
        setPickerView()
        newRoutineView.hourTF.text = currentTime
    }
    
    func setPickerView(){
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor(named: "customBlue")
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Feito", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(hiddenKeyBoard))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        picker.delegate = self
        newRoutineView.hourTF.inputView = picker
        newRoutineView.hourTF.inputAccessoryView = toolBar
    }
    
    @objc func doneAction() {
        
        newRoutineView.hourTF.text = currentTime
        newRoutineView.activityTF.endEditing(true)
        newRoutineView.hourTF.endEditing(true)
        newRoutineView.descriptionTextView.endEditing(true)
    }
    
    @objc func hiddenKeyBoard(){
        newRoutineView.activityTF.endEditing(true)
        newRoutineView.hourTF.endEditing(true)
        newRoutineView.descriptionTextView.endEditing(true)
    }
    
    func navbarSettings() {
        title = "Nova Rotina"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
        self.navigationController?.navigationBar.tintColor = .white
        self.view.backgroundColor = .systemBackground
        let buttonSaveRoutine = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(saveRoutineAction))
        buttonSaveRoutine.tintColor = .white
        self.navigationItem.rightBarButtonItem  = buttonSaveRoutine
    }
    
    @objc func saveRoutineAction() {
        hiddenKeyBoard()
        if self.newRoutineView.activityTF.text?.trimmingCharacters(in: .whitespaces) != "" &&
            self.newRoutineView.hourTF.text != "" && daysSelected.count > 0 && self.newRoutineView.descriptionTextView.text.trimmingCharacters(in: .whitespaces) != ""{
            
            var weekDays:[WeekDay] = []
            
            daysSelected.forEach {
                weekDays.append(.init(day: $0))
            }
            
            let scheduleManager = ScheduleManager()
            
            let routine = RoutineData(activity: self.newRoutineView.activityTF.text!, hour: self.newRoutineView.hourTF.text!, activityDescription: self.newRoutineView.descriptionTextView.text, day: weekDays)
            
            scheduleManager.create(scheduleElement: routine)
            let alert = UIAlertController(title: "Atenção", message: "Rotina criada com sucesso!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: {
                self.newRoutineView.hourTF.text = "00:00"
                self.newRoutineView.activityTF.text = ""
                self.newRoutineView.descriptionTextView.text = ""
                self.daysSelected.forEach { (item) in
                    
                    let cell = self.newRoutineView.daysCollection.cellForItem(at: IndexPath(row: item, section: 0)) as! NewRoutineCollectionViewCell
                    cell.containerDay.backgroundColor = .clear
                    cell.day.textColor = .label
                    self.daysSelected.removeAll { (value) -> Bool in
                        value == item
                    }
                }
                self.daysSelected.removeAll()
            })
            
        }else{
            
            let alert = UIAlertController(title: "Atenção", message: "Você deve preencher todos os campos.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func formatTime(_ i: Int)->String {
        if i < 10 {
            return "0\(i)"
        }else{
            return String(i)
        }
    }

}

extension NewRoutineViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.newRoutineView.daysCollection.dequeueReusableCell(withReuseIdentifier: newRoutineView.cellID, for: indexPath) as! NewRoutineCollectionViewCell
        cell.day.text = newRoutineView.daysString[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = 50
        
        let heigth = 30

        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.newRoutineView.daysCollection.cellForItem(at: indexPath) as! NewRoutineCollectionViewCell
        switch indexPath.item {
        case 0...6:
            if cell.isSelected && cell.containerDay.backgroundColor != UIColor(named: "customBlue"){
                cell.containerDay.backgroundColor = UIColor(named: "customBlue")
                cell.day.textColor = .white
                daysSelected.append(indexPath.item)
            }else{
                cell.containerDay.backgroundColor = .clear
                cell.day.textColor = .label
                daysSelected.removeAll { (value) -> Bool in
                    value == indexPath.item
                }
            }
        default:
            return
        }
    }
    
    
}

extension NewRoutineViewController: UITextFieldDelegate, UITextViewDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

extension NewRoutineViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        }
        return minutes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return formatTime(hours[row])
        }
        
        return formatTime(minutes[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            currentHour = formatTime(hours[row])
        }else {
            currentMinute = formatTime(minutes[row])
        }
        currentTime = "\(currentHour):\(currentMinute)"
        newRoutineView.hourTF.text = currentTime
        
    }
    
}
