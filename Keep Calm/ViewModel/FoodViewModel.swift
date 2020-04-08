//
//  FoodViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 07/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

enum Who {
   case first
   case last
}

class FoodViewModel {
    
    var food: Food
    
    init(food: Food) {
        
        self.food = food
    }
    
    func motivationalText()->String {
        
        return food.motivationalText
    }
    
    func getTitle1()->String {
        
        return food.foodItem.first?.foodCategory ?? "-"
    }
    
    func getTitle2()->String {
        
        return food.foodItem.last?.foodCategory ?? "-"
    }
    
    func countFood(who: Who)->Int {
        
        switch who {
        case .first:
            return food.foodItem.first?.foodType.count ?? 0
        default:
            return food.foodItem.last?.foodType.count ?? 0
        }
    }
    
    func getFoodType(index: Int, who: Who)->FoodType {
        
        switch who {
        case .first:
            return (food.foodItem.first?.foodType[index])!
        case .last:
            return (food.foodItem.last?.foodType[index])!
        }
    }
}
