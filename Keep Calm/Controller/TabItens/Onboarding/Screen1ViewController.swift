//
//  Screen1ViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 14/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Screen1ViewController: UIViewController {
    
    let screen = ScreenView1()
    
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
    }

}
