//
//  RoutineDetailsView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 17/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import CoreData

class RoutineDetailsView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var activityLabel: UILabel = {
        
        let view = UILabel()
        view.text = "Atividade:"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var activity: UILabel = {
        
        let view = UILabel()
        return view
    }()
    
    lazy var hourLabel: UILabel = {
        
        let view = UILabel()
        view.text = "Hora:"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var hour: UILabel = {
        
        let view = UILabel()
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        
        let view = UILabel()
        view.text = "O que vai fazer?"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var activityDescription: UILabel = {
        
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(routine: NSManagedObject) {
        
        activity.text = routine.value(forKey: "activity") as? String
        hour.text = routine.value(forKey: "hour") as? String
        activityDescription.text = routine.value(forKey: "activityDescription") as? String
    }
}

extension RoutineDetailsView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(activityLabel)
        containerView.addSubview(activity)
        containerView.addSubview(hourLabel)
        containerView.addSubview(hour)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(activityDescription)
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
        
        activityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        activity.snp.makeConstraints { (make) in
            make.top.equalTo(activityLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        hourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(activity.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        hour.snp.makeConstraints { (make) in
            make.top.equalTo(hourLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hour.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        activityDescription.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
