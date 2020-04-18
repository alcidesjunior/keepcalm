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
    
    let cellID = "cell"
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var routineEmpty: UIView = {
        
        let view = UIView()
        view.isHidden = false
        return view
    }()
    
    lazy var routineContent: UIView = {
        
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var monday: UILabel = {
        
        let view = UILabel()
        view.text = "Segunda-feira"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var monCollection: UICollectionView = {
        
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
    
    lazy var tuesday: UILabel = {
        
        let view = UILabel()
        view.text = "Terça-feira"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var tueCollection: UICollectionView = {
        
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
    
    lazy var wednesday: UILabel = {
        
        let view = UILabel()
        view.text = "Quarta-feira"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var wedCollection: UICollectionView = {
        
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
    
    lazy var thursday: UILabel = {
        
        let view = UILabel()
        view.text = "Quinta-feira"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var thuCollection: UICollectionView = {
        
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
    
    lazy var friday: UILabel = {
        
        let view = UILabel()
        view.text = "Sexta-feira"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var friCollection: UICollectionView = {
        
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
    
    lazy var saturday: UILabel = {
        
        let view = UILabel()
        view.text = "Sábado"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var satCollection: UICollectionView = {
        
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
    
    lazy var sunday: UILabel = {
        
        let view = UILabel()
        view.text = "Domingo"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        return view
    }()
    
    lazy var sunCollection: UICollectionView = {
        
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
    
    lazy var routineImage: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var routineDescription: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.numberOfLines = 0
        view.textAlignment = .justified
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        registerCell()
    }
    
    func setup(routineViewModel: RoutineViewModel) {
        
        self.routineDescription.text = routineViewModel.getRoutineDescription()
        self.routineImage.image = routineViewModel.getRoutineImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func registerCell() {
        
        monCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        tueCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        thuCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        wedCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        friCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        satCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        sunCollection.register(RoutineDayCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
}

extension RoutineView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(routineEmpty)//.addSubview(routineImage)
        routineEmpty.addSubview(routineImage)
        routineEmpty.addSubview(routineDescription)
        containerView.addSubview(routineContent)
        
        routineContent.addSubview(monday)
        routineContent.addSubview(monCollection)
        routineContent.addSubview(tuesday)
        routineContent.addSubview(tueCollection)
        routineContent.addSubview(wednesday)
        routineContent.addSubview(wedCollection)
        routineContent.addSubview(thursday)
        routineContent.addSubview(thuCollection)
        routineContent.addSubview(friday)
        routineContent.addSubview(friCollection)
        routineContent.addSubview(saturday)
        routineContent.addSubview(satCollection)
        routineContent.addSubview(sunday)
        routineContent.addSubview(sunCollection)
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
        
        routineEmpty.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top)
            make.leading.equalTo(containerView.snp.leading)
            make.trailing.equalTo(containerView.snp.trailing)
            make.bottom.equalTo(containerView.snp.bottom)
        }
        
        routineImage.snp.makeConstraints { (make) in
            make.top.equalTo(routineEmpty.snp.top)
            make.centerX.equalTo(routineEmpty.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        routineDescription.snp.makeConstraints { (make) in
            make.top.equalTo(routineImage.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.bottom.equalToSuperview()
        }
        
        routineContent.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top)
            make.leading.equalTo(containerView.snp.leading)
            make.trailing.equalTo(containerView.snp.trailing)
            make.bottom.equalTo(containerView.snp.bottom)
        }
        
        monday.snp.makeConstraints { (make) in
            make.top.equalTo(routineContent.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        monCollection.snp.makeConstraints { (make) in
            make.top.equalTo(monday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        tuesday.snp.makeConstraints { (make) in
            make.top.equalTo(monCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        tueCollection.snp.makeConstraints { (make) in
            make.top.equalTo(tuesday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        wednesday.snp.makeConstraints { (make) in
            make.top.equalTo(tueCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        wedCollection.snp.makeConstraints { (make) in
            make.top.equalTo(wednesday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        thursday.snp.makeConstraints { (make) in
            make.top.equalTo(wedCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        thuCollection.snp.makeConstraints { (make) in
            make.top.equalTo(thursday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        friday.snp.makeConstraints { (make) in
            make.top.equalTo(thuCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        friCollection.snp.makeConstraints { (make) in
            make.top.equalTo(friday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        saturday.snp.makeConstraints { (make) in
            make.top.equalTo(friCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        satCollection.snp.makeConstraints { (make) in
            make.top.equalTo(saturday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
        }
        
        sunday.snp.makeConstraints { (make) in
            make.top.equalTo(satCollection.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        sunCollection.snp.makeConstraints { (make) in
            make.top.equalTo(sunday.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(70)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
