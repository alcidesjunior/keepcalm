//
//  Food.swift
//  Keep Calm
//
//  Created by Alcides Junior on 07/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Food {
    
    var motivationalText: String
    var foodItem: [FoodItem]
    
    init(){
        
        self.motivationalText = "Manter uma boa alimentação ajuda a ter um dia produtivo e evitar estresse e ansiedade, na medida do possível. Pensando nisso, reuni alguns alimentos ricos em vitamina B e triptofano que ajudam no combate ao estresse e ansiedade."
        
        let alface = FoodType(name: "Alface", foodImage: UIImage(named: "alface")!)
        let abacate = FoodType(name: "Abacate", foodImage: UIImage(named: "abacate")!)
        let castanha = FoodType(name: "Castanha", foodImage: UIImage(named: "castanha")!)
        let uva = FoodType(name: "Uva", foodImage: UIImage(named: "uva")!)
        let frango = FoodType(name: "Frango", foodImage: UIImage(named: "frango")!)
        let melancia = FoodType(name: "Melancia", foodImage: UIImage(named: "melancia")!)
        
        let vitaminaB = FoodItem(foodCategory: "Vitamina B", foodType: [alface, abacate, castanha, uva, frango, melancia])
        
        let banana = FoodType(name: "Banana", foodImage: UIImage(named: "banana")!)
        let ovo = FoodType(name: "Ovo", foodImage: UIImage(named: "ovo")!)
        let queijo = FoodType(name: "Queijo", foodImage: UIImage(named: "queijo")!)
        let soja = FoodType(name: "Soja", foodImage: UIImage(named: "soja")!)
        let peixe = FoodType(name: "Peixe", foodImage: UIImage(named: "peixe")!)
        let aveia = FoodType(name: "Aveia", foodImage: UIImage(named: "aveia")!)
        
        let triptofano = FoodItem(foodCategory: "Triptofano", foodType: [banana, ovo, queijo, soja, peixe, aveia])
        
        self.foodItem = [vitaminaB, triptofano]
    }
    
}

struct FoodItem {
    var foodCategory: String
    var foodType: [FoodType]
}

struct FoodType {
    var name: String
    var foodImage: UIImage
}
