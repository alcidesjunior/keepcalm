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
    var phraseOfTheDay: [String]
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
        
        self.phraseOfTheDay = [
            "\"Quando está suficientemente escuro, você consegue ver as estrelas.\"\n- Charles Beard",
            "\"Pratique a esperança. À medida que a esperança se torna um hábito, você consegue alcançar um espírito permanentemente feliz.\"\n-Norman Vincent Peale",
            "\"Você consegue realizar muito se você não se importa com quem ganha o crédito.\n-Ronald Reagan\"",
            "\"Você não consegue escolher como você vai morrer ou quando. Você consegue apenas decidir como você vai viver. Agora.\n-Joan Baez\"",
            "\"A maior prova de coragem é suportar as derrotas sem perder o ânimo.\n-Robert Ingersoll\"",
            "\"Acredite que você pode, assim você já está no meio do caminho.\n-Theodore Roosevelt\"",
            "\"Você consegue o melhor dos outros quando você dá o melhor de você mesmo.\n-Harry Firestone\"",
            "\"Se você consegue sonhar algo, consegue realizá-lo!\n-Walt Disney\"",
            "\"Sou abraços, sorrisos, ânimo, bom humor, sarcasmo, preguiça e agora sono.\n-Clarice Lispector\"",
            "\"Encontra ânimo na dor e no desafio. Nesta vida só nos são colocados à frente os obstáculos que somos capazes de ultrapassar.\n-Augusto Branco\"",
            "\"Força de ânimo e coragem na adversidade servem para conquistar o êxito, mais do que um exército.\n-John Dryden\""
        ]
        if UserDefaults.standard.value(forKey: "firstName") != nil {
            
            self.firstName = UserDefaults.standard.value(forKey: "firstName") as! String
        }
        
        self.fullName = self.firstName+" "+self.lastName
    }
    
}
