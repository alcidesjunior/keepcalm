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
        
        switch hourInt {
        case 0 ... 11:
            greeting = "Bom dia"
        case 12 ... 17:
            greeting = "Boa tarde"
        default:
            greeting = "Boa noite"
        }
        
        return greeting
        
    }
    
    func getGreeting()->String {
        if getFirstName() == "" {
            return greetingString()+"!"
        }
        return greetingString()+", "+getFirstName()+"!"
    }
    
    func getPhraseOfTheDay()->String {
        let qtd = self.home.phraseOfTheDay.count-1
        let today = Int.random(in: 0...qtd)
        return self.home.phraseOfTheDay[today]
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
