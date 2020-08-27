////
////  HomeViewController.swift
////  Keep Calm
////
////  Created by Alcides Junior on 05/04/20.
////  Copyright © 2020 all seeds labs. All rights reserved.
////
//
//import UIKit
//
//class LogginGatway {
//    static let shared = LogginGatway()
//    private init() {}
//    
//    func isLogged()->Bool {
//        let defaults = UserDefaults.standard
//        if defaults.value(forKey: "firstAccess") == nil {
//            UserDefaults.standard.set(true, forKey: "firstAccess")
//            return true
//        }
//        return false
//    }
//}
//
//class HomeViewController: UIViewController, ControllerProtocol {
//    
//    var home: Home!
//    var homeViewModel: HomeViewModel!
//    var homeView: HomeView!
//    
//    override func loadView() {
//        self.home = Home()
//        self.homeViewModel = HomeViewModel(home: home)
//        self.homeView = HomeView(homeViewModel: homeViewModel)
//        self.view = homeView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navbarSettings()
//        homeView.editProfileButton.addTarget(self, action: #selector(editProfileAction), for: .touchUpInside)
//        self.view.backgroundColor = .systemBackground
//        
//        if LogginGatway.shared.isLogged() {
//            let onboarding = OnboardingViewController()
//            onboarding.modalPresentationStyle = .fullScreen
//            self.present(onboarding, animated: false, completion: nil)
//        }
//    }
//    
//    @objc func editProfileAction() {
//        
//        let profile = ProfileViewController()
//        profile.delegate = self
//        profile.modalPresentationStyle = .fullScreen
//        self.present(profile, animated: true, completion: nil)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        self.homeView.profileImage.makeRounded()
//    }
//    
//    func navbarSettings() {
//        title = "Início"
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.barTintColor = GlobalSettings.Colors.NavColors.navColor
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: GlobalSettings.Colors.NavColors.title]
//        self.navigationController?.navigationBar.tintColor = .white
//    }
//
//}
//
//extension HomeViewController: SavedDataProtocol {
//    func didUpdateData() {
//        DispatchQueue.main.async {
//
//            self.loadView()
//            self.viewDidLoad()
//        }
//    }
//    
//    
//}
