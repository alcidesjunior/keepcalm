//
//  ExercisesView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class ExercisesView: UIView {
    
    let cellID = "exerciseCollectionID"
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    
    lazy var exerciseLabel: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    convenience init(exerciseMotivation: String) {
        self.init()
        self.exerciseLabel.text = exerciseMotivation
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCell(){
        
        collectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension ExercisesView: ViewCodeProtocol {
    func buildViews() {
        
//        let components = [exerciseLabel, collectionView]
//        components.forEach { (component) in
//            addSubview(component)
//        }
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(exerciseLabel)
        containerView.addSubview(collectionView)
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
        
        exerciseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(exerciseLabel.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(containerView.snp.bottom)
            make.width.equalTo(containerView.snp.width)        }
    }
    
    func extraSettings() {
        registerCell()
    }
    
    
}
