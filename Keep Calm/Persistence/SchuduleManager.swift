//
//  SchuduleManager.swift
//  Keep Calm
//
//  Created by Alcides Junior on 17/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import CoreData

public class ScheduleManager {
    
    var data: [NSManagedObject] = []
    
    
    func create(scheduleElement: RoutineData) {
        scheduleElement.day.forEach { (element) in
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let scheduleEntity = NSEntityDescription.entity(forEntityName: "Schedule", in: managedContext)!
            let newSchedule = NSManagedObject(entity: scheduleEntity, insertInto: managedContext)
        
        
            let _id = UUID().uuidString
            let notification = NotificationTools()
            newSchedule.setValue(_id, forKey: "id")
            newSchedule.setValue(scheduleElement.activity, forKey: "activity")
            newSchedule.setValue(scheduleElement.activityDescription, forKey: "activityDescription")
            newSchedule.setValue(scheduleElement.hour, forKey: "hour")
            newSchedule.setValue(element.day, forKey: "day")
            
            let activity = scheduleElement.activity
            let completeHour = scheduleElement.hour
            let hour = Int(completeHour.split(separator: ":")[0])!
            let minute = Int(completeHour.split(separator: ":")[1])!
            let day = element.day
            
            notification.createNotification(title: "Rotina diária",subtitle: completeHour, body: activity, hour: hour, minute: minute, day: day)
            do {
                
                try managedContext.save()
                print("salvou")
                
            } catch let error as NSError {
                
                print(error)
                
            }
        }
        
        
        
    }
    
    func getAll()->[NSManagedObject]?{
            let notification = NotificationTools()
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
            let sortDescriptor = NSSortDescriptor(key: "hour", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
    //        fetchRequest.predicate = NSPredicate(format: "day == \(byDay)")
            
            do {
                
                let results = try managedContext.fetch(fetchRequest)
                self.data.removeAll()
//                notification.removeNotifications()
                for result in results as! [NSManagedObject]{
                    self.data.append(result)
                    let activity = result.value(forKey: "activity") as! String
                    let completeHour = result.value(forKey: "hour") as! String
                    let hour = Int(completeHour.split(separator: ":")[0])!
                    let minute = Int(completeHour.split(separator: ":")[1])!
                    let day = result.value(forKey: "day") as! Int
                    notification.createNotification(title: "Rotina diária",subtitle: completeHour, body: activity, hour: hour, minute: minute, day: day)
                }
                
            } catch {
                print("erro")
            }
            
            return self.data
        }
    
    func deleteAll() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            
            try managedContext.execute(request)
            
        } catch let error as NSError {
            
            print(error)
            
        }
        
    }
    
    func getData(byDay: Int = 0)->[NSManagedObject]? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
        fetchRequest.predicate = NSPredicate(format: "day == \(byDay)")
        let sortDescriptor = NSSortDescriptor(key: "hour", ascending: true)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            
            let results = try managedContext.fetch(fetchRequest)
            self.data.removeAll()
            for result in results as! [NSManagedObject]{
                self.data.append(result)
            }
            
        } catch {
            print("erro")
        }
        
        return self.data
        
    }
    
    func dataExist(id: String)->Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")
        
        do {
            
            let request = try managerContext.fetch(fetchRequest)
            let objectToDelete = request
            
            if objectToDelete.first != nil {
                
                return true
                
            } else {
                
                return false
                
            }
            
        }catch{
            return false
        }
    }
    
    func delete(id: String, completion: @escaping (Result<Bool, Error>)->Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
        fetchRequest.predicate = NSPredicate(format: "id == '\(id)'")

        do{
            let request = try managerContext.fetch(fetchRequest)
            let objectToDelete = request.first as! NSManagedObject
            let activity = objectToDelete.value(forKey: "activity") as! String
            let time = (objectToDelete.value(forKey: "hour") as! String).split(separator: ":")
            let day = objectToDelete.value(forKey: "day") as! Int
            let hour = time[0]
            let minute = time[1]
            let notificationId = "\(activity)\(hour)\(minute)\(day)"
            let notificationTools = NotificationTools()
            notificationTools.removeNotification(id: [notificationId])
            managerContext.delete(objectToDelete)

            do{
                try managerContext.save()
                completion(.success(true))
            }catch{
                completion(.failure(error))
            }
        }catch{
            completion(.failure(error))
        }

    }
}
