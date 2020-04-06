//
//  HomeViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var home: Home
    
    init(home: Home) {
        
        self.home = home
    }
    
    func getProfileImage()->String{
        
        return self.home.profileImage
    }
    
    func getGreeting()->String {
        
        return self.home.greeting
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
