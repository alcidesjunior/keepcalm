//
//  ScreenView4.swift
//  Keep Calm
//
//  Created by Alcides Junior on 15/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class ScreenView4: UIView {
    
    lazy var avatar: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var buttonIniciar: UIButton = {
        
        let view = UIButton()
        view.setImage(UIImage(named: "buttonIniciar"), for: .normal)
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        avatar.image = UIImage(named: "logoKeepCalm")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScreenView4: ViewCodeProtocol {
    func buildViews() {
        addSubview(avatar)
        addSubview(buttonIniciar)
    }
    
    func setConstraints() {
        
        avatar.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(283)
            make.height.equalTo(283)
        }
        
        buttonIniciar.snp.makeConstraints { (make) in
            
            make.top.equalTo(avatar.snp.bottom).inset(3)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(UIScreen.main.bounds.height/3)
            make.bottom.equalToSuperview()
        }
    }
    
    func extraSettings() {
        
    }
    
    
    
}
