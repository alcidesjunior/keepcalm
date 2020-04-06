//
//  Home.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

class Home {
    
    var profileImage: String
    var phraseOfTheDay: String
    var firstName: String
    var lastName: String
    var fullName: String
    
    init() {
        
        self.profileImage = "profilePic"
        self.phraseOfTheDay = "Tente de novo. Fracasse de novo. Mas fracasse melhor - Samuel Beckett"
        self.firstName = "Alcides"
        self.lastName = "Junior"
        self.fullName = self.firstName+" "+self.lastName
    }
    
}
