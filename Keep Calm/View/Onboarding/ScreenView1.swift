//
//  ScreenView1.swift
//  Keep Calm
//
//  Created by Alcides Junior on 14/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class ScreenView1: UIView {
    
    lazy var avatar: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var viewBase: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var textBase: UILabel = {
        
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont.init(name: "Marker Felt", size: 23)
        view.textAlignment = .center
        view.textColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        avatar.image = UIImage(named: "ilustracao1")
        textBase.text = "já se deparou com ansiedade\ne muita das vezes sem saber como\nlidar com isso e nem manter\ncomo uma rotina?"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScreenView1: ViewCodeProtocol {
    func buildViews() {
        addSubview(avatar)
        addSubview(viewBase)
        viewBase.addSubview(textBase)
    }
    
    func setConstraints() {
        
        avatar.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
        
        viewBase.snp.makeConstraints { (make) in
            
            make.top.equalTo(avatar.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(UIScreen.main.bounds.height/3)
            make.bottom.equalToSuperview()
        }
        
        textBase.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(viewBase.snp.centerX)
            make.centerY.equalTo(viewBase.snp.centerY)
        }
    }
    
    func extraSettings() {
        
    }
    
    
    
}
