////
////  FoodCell.swift
////  Keep Calm
////
////  Created by Alcides Junior on 07/04/20.
////  Copyright © 2020 all seeds labs. All rights reserved.
////
//
//import UIKit
//
//class FoodCell: UICollectionViewCell {
//    
//    lazy var foodImage: UIImageView = {
//        
//        let view = UIImageView()
//        return view
//    }()
//    
//    lazy var foodName: UILabel = {
//        
//        let view = UILabel()
//        return view
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    func setup(foodType: FoodType) {
//        
//        foodImage.image = foodType.foodImage
//        foodName.text = foodType.name
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension FoodCell: ViewCodeProtocol {
//    func buildViews() {
//        let components = [foodImage, foodName]
//        components.forEach { (component) in
//            addSubview(component)
//        }
//    }
//    
//    func setConstraints() {
//        foodImage.snp.makeConstraints { (make) in
//            make.width.equalTo(80)
//            make.height.equalTo(80)
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview()
//        }
//        
//        foodName.snp.makeConstraints { (make) in
//            make.top.equalTo(foodImage.snp.bottom)
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
//    }
//    
//    func extraSettings() {
//        
//    }
//    
//    
//}
