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
        
        homeViewController.tabBarItem = UITabBarItem(title: "Início", image: UIImage(named: "home"), selectedImage: UIImage(named: "home.fill"))
        routinesViewController.tabBarItem = UITabBarItem(title: "Rotina", image: UIImage(named: "routine"), selectedImage: UIImage(named: "routine.fill"))
        exercisesViewController.tabBarItem = UITabBarItem(title: "Exercícios", image: UIImage(named: "exercise"), selectedImage: UIImage(named: "exercise.fill"))
        foodViewController.tabBarItem = UITabBarItem(title: "Alimentação", image: UIImage(named: "food"), selectedImage: UIImage(named: "food.fill"))
        anxietyViewController.tabBarItem = UITabBarItem(title: "Ansiedade", image: UIImage(named: "anxiety"), selectedImage: UIImage(named: "anxiety.fill"))


        let controllers = [homeViewController, routinesViewController, exercisesViewController, foodViewController, anxietyViewController]
        self.viewControllers = controllers
        self.selectedIndex = 3
    }
}
