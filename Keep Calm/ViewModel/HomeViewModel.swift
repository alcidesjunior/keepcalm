//
//  HomeViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    var home: Home
    
    init(home: Home) {
        
        self.home = home
    }
    
    func getProfileImage()->String{
        
        return self.home.profileImage
    }
    
    fileprivate func greetingString()->String {
        let date = NSDate()
        var greeting = ""
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!

        if hourInt >= 12 && hourInt <= 16 {
            greeting = "Bom dia"
        }
        else if hourInt >= 7 && hourInt <= 12 {
            greeting = "Boa tarde"
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = "Boa noite"
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = "Boa noite"
        }
        else if hourInt >= 0 && hourInt <= 7 {
            greeting = "Boa noite"
        }
        
        return greeting
        
    }
    
    func getGreeting()->String {
        
        return greetingString()+", "+getFirstName()+"!"
    }
    
    func getPhraseOfTheDay()->String {
        
        return "\""+self.home.phraseOfTheDay+"\""
    }
    
    func getFirstName()->String {
        
        return self.home.firstName
    }
    
    func getLastName()->String {
        
        return self.home.lastName
    }
    
    func getFullName()->String {
        
        return self.home.fullName
    }
}
