//
//  HomeView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    lazy var profileImage: UIImageView = {
        
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var greetingPhrase: UILabel = {
        
        let view = UILabel()
        view.font = .greeting
        return view
    }()
    
    lazy var motivationalPhrase: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    convenience init(homeViewModel: HomeViewModel) {
        self.init()
        
        profileImage.image = UIImage(named: homeViewModel.getProfileImage())
        greetingPhrase.text = homeViewModel.getGreeting()
        motivationalPhrase.text = homeViewModel.getPhraseOfTheDay()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeView: ViewCodeProtocol {
    func buildViews() {
        
        let components = [profileImage, greetingPhrase, motivationalPhrase]
        components.forEach { (component) in
            addSubview(component)
        }
    }
    
    func setConstraints() {
        
        profileImage.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(60)
            make.width.equalTo(146)
            make.height.equalTo(146)
            
        }
        
        greetingPhrase.snp.makeConstraints { (make) in
            
            make.top.equalTo(profileImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        motivationalPhrase.snp.makeConstraints { (make) in
            
            make.top.equalTo(greetingPhrase.snp.bottom).offset(40)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.leading.equalToSuperview().inset(16)
        }
        
        
    }
    
    func extraSettings() {
        
    }
    
    
    
}

extension UIImageView {

    func makeRounded() {

        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
