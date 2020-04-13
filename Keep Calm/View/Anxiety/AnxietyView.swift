//
//  AnxietyView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 08/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class AnxietyView: UIView {
    
    let cellID = "anxietyCollectionID"
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    
    lazy var anxietyLabel: UILabel = {
        
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
    
    convenience init(anxietyMotivation: String) {
        self.init()
        self.anxietyLabel.text = anxietyMotivation
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCell(){
        
        collectionView.register(AnxietyCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension AnxietyView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(anxietyLabel)
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
        
        anxietyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(anxietyLabel.snp.bottom).offset(48)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(containerView.snp.bottom)
            make.width.equalTo(containerView.snp.width)        }
    }
    
    func extraSettings() {
        registerCell()
    }
    
    
}
