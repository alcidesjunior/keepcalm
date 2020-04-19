//
//  NewRoutineView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 16/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class NewRoutineView: UIView {
    
    let cellID = "cellID"
    let daysString = ["Seg","Ter","Qua","Qui","Sex","Sab","Dom"]
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    //label
    lazy var activityLabel: UILabel = {
        
        let view = UILabel()
        view.text = "Atividade:"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    //textfield
    lazy var activityTF: UITextField = {
        
        let view = UITextField()
        view.borderStyle = .roundedRect
        return view
    }()
    //label
    lazy var hourLabel: UILabel = {
        
        let view = UILabel()
        view.text = "Hora:"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    //textfield
    lazy var hourTF: UITextField = {
        
        let view = UITextField()
        view.borderStyle = .roundedRect
        return view
    }()
    //label
    lazy var dayLabel: UILabel = {
        
        let view = UILabel()
        view.text = "Dia:"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    //days buttons
    
    //monday
    lazy var daysCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 12)
        view.backgroundColor = .systemBackground
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    lazy var descriptionActivityLabel: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.text = "O que vai fazer?"
        return view
    }()
    
    lazy var descriptionTextView: UITextView = {
        
        let view = UITextView()
        view.layer.borderWidth = 1
//        view.isScrollEnabled = false
//        view.sizeToFit()
        view.font = UIFont.systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCell(){
        daysCollection.register(NewRoutineCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension NewRoutineView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(activityLabel)
        containerView.addSubview(activityTF)
        containerView.addSubview(hourLabel)
        containerView.addSubview(hourTF)
        containerView.addSubview(dayLabel)
        containerView.addSubview(daysCollection)
        containerView.addSubview(descriptionActivityLabel)
        containerView.addSubview(descriptionTextView)
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
            make.top.equalTo(containerView.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
        }
        
        activityTF.snp.makeConstraints { (make) in
            make.top.equalTo(activityLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        hourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(activityTF.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
        }
        
        hourTF.snp.makeConstraints { (make) in
            make.top.equalTo(hourLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        dayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hourTF.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
        }
        
        daysCollection.snp.makeConstraints { (make) in
            make.top.equalTo(dayLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(55)
        }
        
        descriptionActivityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(daysCollection.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
        }
        
        descriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionActivityLabel.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(UIScreen.main.bounds.height/2.3)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
