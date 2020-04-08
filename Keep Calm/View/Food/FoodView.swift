//
//  FoodView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 07/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class FoodView: UIView {
    
    let cellID1 = "cell1"
    let cellID2 = "cell2"
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var motivationalText: UILabel = {
        
        let view = UILabel()
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    lazy var title1: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    let collection1: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        view.backgroundColor = .systemBackground
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var title2: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    let collection2: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        view.backgroundColor = .systemBackground
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    convenience init(foodViewModel: FoodViewModel) {
        self.init()
        self.title1.text = foodViewModel.getTitle1()
        self.title2.text = foodViewModel.getTitle2()
        self.motivationalText.text = foodViewModel.motivationalText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCells(){
        
        collection1.register(FoodCell.self, forCellWithReuseIdentifier: cellID1)
        collection2.register(FoodCell.self, forCellWithReuseIdentifier: cellID2)
    }
}

extension FoodView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(motivationalText)
        containerView.addSubview(title1)
        containerView.addSubview(collection1)
        containerView.addSubview(title2)
        containerView.addSubview(collection2)
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
        
        motivationalText.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
        }
        
        title1.snp.makeConstraints { (make) in
            make.top.equalTo(motivationalText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        collection1.snp.makeConstraints { (make) in
            make.top.equalTo(title1.snp.bottom)//.inset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/4)
        }
        
        title2.snp.makeConstraints { (make) in
            make.top.equalTo(collection1.snp.bottom).inset(16)
            make.centerX.equalTo(title1.snp.centerX)
        }
        
        collection2.snp.makeConstraints { (make) in
            make.top.equalTo(title2.snp.bottom)
            make.height.equalTo(UIScreen.main.bounds.height/4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func extraSettings() {
        registerCells()
    }
    
    
    
}
