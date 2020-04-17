//
//  NewRoutineCollectionViewCell.swift
//  Keep Calm
//
//  Created by Alcides Junior on 16/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class NewRoutineCollectionViewCell: UICollectionViewCell {
    
    lazy var day: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }()
    
    
    lazy var containerDay: UIView = {
        
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewRoutineCollectionViewCell: ViewCodeProtocol {
    func buildViews() {
        addSubview(containerDay)
        containerDay.addSubview(day)
    }
    
    func setConstraints() {
        containerDay.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        day.snp.makeConstraints { (make) in
            make.centerX.equalTo(containerDay.snp.centerX)
            make.centerY.equalTo(containerDay.snp.centerY)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
