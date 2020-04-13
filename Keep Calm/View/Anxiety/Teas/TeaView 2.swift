//
//  TeaView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit
import YoutubePlayerView

class TeaView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var title1: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var description1: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView1: YoutubePlayerView = {
        
        let view = YoutubePlayerView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var title2: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var description2: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView2: YoutubePlayerView = {
        
        let view = YoutubePlayerView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var title3: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var description3: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView3: YoutubePlayerView = {
        
        let view = YoutubePlayerView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setup(anxietyViewModel: [AnxietyViewModel]) {
        
        title1.text = anxietyViewModel[0].getTitle()
        description1.text = anxietyViewModel[0].getDescription()
        videoPlayerView1.loadWithVideoId(anxietyViewModel[0].getMovieUrl())
        
        title2.text = anxietyViewModel[1].getTitle()
        description2.text = anxietyViewModel[1].getDescription()
        videoPlayerView2.loadWithVideoId(anxietyViewModel[1].getMovieUrl())
        
        title3.text = anxietyViewModel[2].getTitle()
        description3.text = anxietyViewModel[2].getDescription()
        videoPlayerView3.loadWithVideoId(anxietyViewModel[2].getMovieUrl())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TeaView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(title1)
        containerView.addSubview(description1)
        containerView.addSubview(videoPlayerView1)
        
        containerView.addSubview(title2)
        containerView.addSubview(description2)
        containerView.addSubview(videoPlayerView2)
        
        containerView.addSubview(title3)
        containerView.addSubview(description3)
        containerView.addSubview(videoPlayerView3)
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
        
        title1.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        description1.snp.makeConstraints { (make) in
            make.top.equalTo(title1.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        videoPlayerView1.snp.makeConstraints { (make) in
            make.top.equalTo(description1.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(8)
            make.height.equalTo(190)
        }
        
        title2.snp.makeConstraints { (make) in
            make.top.equalTo(videoPlayerView1.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        description2.snp.makeConstraints { (make) in
            make.top.equalTo(title2.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        videoPlayerView2.snp.makeConstraints { (make) in
            make.top.equalTo(description2.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(8)
            make.height.equalTo(190)
        }
        
        title3.snp.makeConstraints { (make) in
            make.top.equalTo(videoPlayerView2.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        description3.snp.makeConstraints { (make) in
            make.top.equalTo(title3.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        videoPlayerView3.snp.makeConstraints { (make) in
            make.top.equalTo(description3.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(8)
            make.height.equalTo(190)
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
