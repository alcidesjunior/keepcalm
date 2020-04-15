//
//  ExerciseDetailsView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 06/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit

class ExerciseDetailsView: UIView {
    
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var avatar: UIImageView = {
        
        let view = UIImageView()
        return view
    }()
    
    lazy var textDescription: UILabel = {
        
        let view = UILabel()
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var source: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.numberOfLines = 0
        return view
    }()
    
    lazy var sourceText: UITextView = {
        
        let view = UITextView()
        view.textAlignment = .left
        view.dataDetectorTypes = .link
        view.sizeToFit()
        view.isScrollEnabled = false
        view.isEditable = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setup(activity: Activity){
        
        avatar.image = activity.avatar
        textDescription.text = activity.description
        source.text = "Fonte: "
        sourceText.text = activity.source
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExerciseDetailsView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(avatar)
        containerView.addSubview(textDescription)
        containerView.addSubview(source)
        containerView.addSubview(sourceText)
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
        
        avatar.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalTo(containerView.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        textDescription.snp.makeConstraints { (make) in
            make.top.equalTo(avatar.snp.bottom)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        source.snp.makeConstraints { (make) in
            make.top.equalTo(textDescription.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        sourceText.snp.makeConstraints { (make) in
            make.top.equalTo(source.snp.bottom)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func extraSettings() {
        
    }
    
    
    
}
