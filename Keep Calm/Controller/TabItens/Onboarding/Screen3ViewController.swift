//
//  Screen3ViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 15/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Screen3ViewController: UIViewController {
    
    let screen = ScreenView3()
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLayoutSubviews() {
        screen.avatar.alpha = 0
        UIView.animate(withDuration: 1.5) {
            self.screen.avatar.alpha = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

}
