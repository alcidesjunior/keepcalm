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
            print(_id)
            print("dia: \(element.day)")
            newSchedule.setValue(_id, forKey: "id")
            newSchedule.setValue(scheduleElement.activity, forKey: "activity")
            newSchedule.setValue(scheduleElement.activityDescription, forKey: "activityDescription")
            newSchedule.setValue(scheduleElement.hour, forKey: "hour")
            newSchedule.setValue(element.day, forKey: "day")
            
            do {
                
                try managedContext.save()
                print("salvou")
                
            } catch let error as NSError {
                
                print(error)
                
            }
        }
        
        
        
    }
    
    func getAll()->[NSManagedObject]?{
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Schedule")
    //        fetchRequest.predicate = NSPredicate(format: "day == \(byDay)")
            
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
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")

        do{
            let request = try managerContext.fetch(fetchRequest)
            let objectToDelete = request.first as! NSManagedObject
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
