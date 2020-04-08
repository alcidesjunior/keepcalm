//
//  FoodViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, ControllerProtocol {
    
    var food: Food!
    var foodViewModel: FoodViewModel!
    var foodView: FoodView!
    
    override func loadView() {
        self.food = Food()
        self.foodViewModel = FoodViewModel(food: food)
        self.foodView = FoodView(foodViewModel: foodViewModel)
        self.view = self.foodView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
        
        foodView.collection1.delegate = self
        foodView.collection1.dataSource = self
        
        foodView.collection2.delegate = self
        foodView.collection2.dataSource = self
    }

    func navbarSettings() {
        title = "Alimentação"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
    }
}

extension FoodViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == foodView.collection1 {
            
            return foodViewModel.countFood(who: .first)
            
        }else{
            
            return foodViewModel.countFood(who: .last)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == foodView.collection1 {
            
            let cell = foodView.collection1.dequeueReusableCell(withReuseIdentifier: foodView.cellID1, for: indexPath) as! FoodCell
            let foodType = foodViewModel.getFoodType(index: indexPath.item, who: .first)
            cell.setup(foodType: foodType)
            
            return cell
        }else {
            
            let cell = foodView.collection2.dequeueReusableCell(withReuseIdentifier: foodView.cellID2, for: indexPath) as! FoodCell
            let foodType = foodViewModel.getFoodType(index: indexPath.item, who: .last)
            cell.setup(foodType: foodType)
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width * 0.46
        let heigth = view.frame.size.height * 0.22

        return CGSize(width: width, height: heigth)
    }
    
}
