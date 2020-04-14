//
//  ProfileView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 13/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    lazy var title: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.text = "Perfil"
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var changeProfileButton: UIButton = {
        
        let view = UIButton()
        view.setTitleColor(UIColor(named: "customBlue"), for: .normal)
        view.isEnabled = true
        view.setTitle("Alterar foto", for: .normal)
        return view
    }()
    
    lazy var userNameInput: UITextField = {
        
        let view = UITextField()
        view.borderStyle = .roundedRect
        return view
    }()
    
    lazy var stack: UIStackView = {
        
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    lazy var saveButton: UIButton = {
        
        let view = UIButton()
        view.setTitle("Salvar", for: .normal)
        view.backgroundColor = UIColor(named: "customGreen")
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        
        let view = UIButton()
        view.setTitle("Cancelar", for: .normal)
        view.backgroundColor = UIColor(named: "customRed")
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        let home = Home()
        let homeViewModel = HomeViewModel(home: home)
        self.profileImage.image = UIImage(named: homeViewModel.getProfileImage())
        self.userNameInput.text = homeViewModel.getFirstName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileView: ViewCodeProtocol {
    func buildViews() {
        
        let components = [title, profileImage, changeProfileButton, userNameInput, stack]
        components.forEach { (component) in
            addSubview(component)
        }
        
        stack.addArrangedSubview(saveButton)
        stack.addArrangedSubview(cancelButton)
    }
    
    func setConstraints() {
        
        title.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(title.snp.top).inset(85)
            make.width.equalTo(146)
            make.height.equalTo(146)
        }
        
        changeProfileButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.width.equalTo(146)
            make.centerX.equalTo(profileImage.snp.centerX)
        }
        
        userNameInput.snp.makeConstraints { (make) in
            make.top.equalTo(changeProfileButton.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(50)
        }
        
        stack.snp.makeConstraints { (make) in
            make.top.equalTo(userNameInput.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }

        cancelButton.snp.makeConstraints { (make) in
            make.width.equalTo(saveButton.snp.width)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
