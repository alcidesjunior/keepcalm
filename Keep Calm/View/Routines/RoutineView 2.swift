//
//  RoutineView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class RoutineView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var routineImage: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var routineDescription: UILabel = {
        
        let view = UILabel()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setup(routineViewModel: RoutineViewModel) {
        
        self.routineDescription.text = routineViewModel.getRoutineDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoutineView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(routineImage)
        containerView.addSubview(routineDescription)
    }
    
    func setConstraints() {
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        routineImage.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top)
            make.centerX.equalTo(containerView.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        routineDescription.snp.makeConstraints { (make) in
            make.top.equalTo(routineImage.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(16)
        }
        
    }
    
    func extraSettings() {
        
    }
    
    
}
