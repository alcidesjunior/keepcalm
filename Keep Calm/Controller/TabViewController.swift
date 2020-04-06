//
//  TabViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        
        tabbarSettings()
    }
    
    fileprivate func tabbarSettings() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let routinesViewController = UINavigationController(rootViewController: RoutinesViewController())
        let exercisesViewController = UINavigationController(rootViewController: ExercisesViewController())
        let foodViewController = UINavigationController(rootViewController: FoodViewController())
        let anxietyViewController = UINavigationController(rootViewController: AnxietyViewController())
        
        homeViewController.tabBarItem = UITabBarItem(title: "Início", image: nil, selectedImage: nil)
        routinesViewController.tabBarItem = UITabBarItem(title: "Rotina", image: nil, selectedImage: nil)
        exercisesViewController.tabBarItem = UITabBarItem(title: "Exercícios", image: nil, selectedImage: nil)
        foodViewController.tabBarItem = UITabBarItem(title: "Alimentação", image: nil, selectedImage: nil)
        anxietyViewController.tabBarItem = UITabBarItem(title: "Ansiedade", image: nil, selectedImage: nil)


        let controllers = [homeViewController, routinesViewController, exercisesViewController, foodViewController, anxietyViewController]
        self.viewControllers = controllers
    }
}
