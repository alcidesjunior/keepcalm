//
//  AnxietyCell.swift
//  Keep Calm
//
//  Created by Alcides Junior on 08/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class AnxietyCell: UICollectionViewCell {
    
    lazy var itemView: UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var itemLabel: UILabel = {
        
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.3))
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setup(activity: AnxietyActivity, viewColor: UIColor) {
        
        itemLabel.text = activity.activityName
        itemView.backgroundColor = viewColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnxietyCell: ViewCodeProtocol {
    
    func buildViews() {
        addSubview(itemView)
        itemView.addSubview(itemLabel)
    }
    
    func setConstraints() {
        
        itemView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        itemLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(itemView.snp.centerX)
            make.centerY.equalTo(itemView.snp.centerY)
        }
    }
    
    func extraSettings() {
        
    }
    
    
    
}
