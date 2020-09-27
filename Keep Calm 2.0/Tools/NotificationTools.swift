//
//  NotificationTools.swift
//  Keep Calm
//
//  Created by Alcides Junior on 22/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationTools {
    
    let notificationCenter: UNUserNotificationCenter
    var options: UNAuthorizationOptions?
    
    init() {
        self.notificationCenter = UNUserNotificationCenter.current()
    }
    
    func requestAuthorization() {
        self.options = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: self.options!) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
    
    func createNotification(title: String,subtitle: String, body: String, hour: Int, minute: Int, day: Int){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.weekday = day + 2
        let id = "\(body)\(hour)\(minute)\(day)"
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        notificationCenter.getPendingNotificationRequests { (notifications) in
            
            if notifications.count == 0 {
                self.notificationCenter.add(request){ (error) in
                    if error != nil {
                        print("Error when try send notification")
                    }else{
                        print("Notification sent! X")
                    }
                }
            }else {
                var ids = [""]
                notifications.forEach { (notification) in
                    ids.append(notification.identifier)
                }
                if !ids.contains(id){
                    self.notificationCenter.add(request){ (error) in
                        if error != nil {
                            print("Error when try send notification")
                        }else{
                            print("Notification sent!")
                        }
                    }
                }
                ids.removeAll()
            }
        }
        
    }
    
    func removeNotifications() {
        self.notificationCenter.removeAllPendingNotificationRequests()
        self.notificationCenter.removeAllDeliveredNotifications()
    }
    
    func removeNotification(id: [String]) {
       self.notificationCenter.removePendingNotificationRequests(withIdentifiers: id)
    }
}
