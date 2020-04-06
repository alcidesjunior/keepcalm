//
//  HomeViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    
}

class HomeViewController: UIViewController, ControllerProtocol {
    
    var home: Home!
    var homeViewModel: HomeViewModel!
    var homeView: HomeView!
    
    override func loadView() {
        self.home = Home()
        self.homeViewModel = HomeViewModel(home: home)
        self.homeView = HomeView(homeViewModel: homeViewModel)
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbarSettings()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        self.homeView.profileImage.makeRounded()
    }
    
    func navbarSettings() {
        title = "Início"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
    }

}

