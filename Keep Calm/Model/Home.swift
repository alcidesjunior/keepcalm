//
//  Home.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Home {
    
    var profileImage: String
    var phraseOfTheDay: String
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String
    
    init() {
        
        if (UserDefaults.standard.value(forKey: "userProfileImage") != nil) {
            let imageData = UserDefaults.standard.value(forKey: "userProfileImage") as! String
            self.profileImage = imageData
        }else{
            
            self.profileImage = "profileDefault"
        }
        
        self.phraseOfTheDay = "Tente de novo. Fracasse de novo. Mas fracasse melhor - Samuel Beckett"
        if UserDefaults.standard.value(forKey: "firstName") != nil {
            
            self.firstName = UserDefaults.standard.value(forKey: "firstName") as! String
        }
        
        self.fullName = self.firstName+" "+self.lastName
    }
    
}
