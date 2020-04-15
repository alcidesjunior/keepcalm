//
//  Screen4ViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 15/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class Screen4ViewController: UIViewController {
    
    let screen = ScreenView4()
    var delegate: SavedDataProtocol? = nil
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLayoutSubviews() {
        screen.avatar.alpha = 0
        UIView.animate(withDuration: 1.5) {
            self.screen.avatar.alpha = 1
        }
    }
    
    @objc func callToAction() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        screen.buttonIniciar.addTarget(self, action: #selector(callToAction), for: .touchUpInside)
    }

}
