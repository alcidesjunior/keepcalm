//
//  BreatheView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit
import WebKit

class BreatheView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var breathDescription: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.phrase
        view.textAlignment = .justified
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView: WKWebView = {
        
        let view = WKWebView()
        view.backgroundColor = .black
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(breatheViewModel: AnxietyViewModel) {
        let url = URL(string: breatheViewModel.getMovieUrl())!
        let request = NSURLRequest(url: url)
        videoPlayerView.load(request as URLRequest)
        //videoPlayerView.loadWithVideoId(breatheViewModel.getMovieUrl())
        //videoPlayerView.seek(to: 30, allowSeekAhead: true)
        
        breathDescription.text = breatheViewModel.getDescription()
    }
    
}

extension BreatheView: ViewCodeProtocol {
    func buildViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(breathDescription)
        containerView.addSubview(videoPlayerView)
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
        
        breathDescription.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).inset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
           
        }
        
        videoPlayerView.snp.makeConstraints { (make) in
            make.top.equalTo(breathDescription.snp.bottom).offset(8)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(8)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(8)
            make.height.equalTo(190)
            make.bottom.equalTo(containerView.snp.bottom)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
