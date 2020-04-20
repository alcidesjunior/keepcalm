//
//  MusicsView.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit
import SnapKit
import WebKit

class MusicsView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        return view
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        return view
    }()
    
    lazy var intro: UILabel = {
        
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .justified
        view.font = UIFont.phrase
        return view
    }()
    
    lazy var title1: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView1: WKWebView = {
        
        let view = WKWebView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var title2: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView2: WKWebView = {
        
        let view = WKWebView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var title3: UILabel = {
        
        let view = UILabel()
        view.font = UIFont.greeting
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    
    lazy var videoPlayerView3: WKWebView = {
        
        let view = WKWebView()
        view.backgroundColor = .black
        return view
    }()
    
//    lazy var title4: UILabel = {
//
//        let view = UILabel()
//        view.font = UIFont.greeting
//        view.textAlignment = .left
//        view.numberOfLines = 0
//        return view
//    }()
//
//    lazy var videoPlayerView4: YoutubePlayerView = {
//
//        let view = YoutubePlayerView()
//        view.backgroundColor = .black
//        return view
//    }()
//
//    lazy var title5: UILabel = {
//
//        let view = UILabel()
//        view.font = UIFont.greeting
//        view.textAlignment = .left
//        view.numberOfLines = 0
//        return view
//    }()
//
//    lazy var videoPlayerView5: YoutubePlayerView = {
//
//        let view = YoutubePlayerView()
//        view.backgroundColor = .black
//        return view
//    }()
    
    var components: [Components] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.components = [Components(title: title1, videoPlay: videoPlayerView1), Components(title: title2, videoPlay: videoPlayerView2), Components(title: title3, videoPlay: videoPlayerView3)]
        setupViews()
    }
    
    func setup(anxietyViewModel: [AnxietyViewModel]) {
        
        self.intro.text = "Se você é do tipo de pessoa que passa a maior parte do seu tempo com fones de ouvido, trago uma ótima notícia para você:\nExiste um estudo feito pela britânica Mindlab – organização focada em estudos referentes ao impacto que a comunicação exerce sobre o nosso cérebro, que criou uma playlist com uma série de músicas que, segundo eles, após vários testes com diversos sensores espalhados pelo corpo das pessoas voluntárias em seu teste, são capazes de reduzir a ansiedade em até 65%. Eles caracterizaram essas músicas com  sendo “Weighless”, ou seja, sem peso, muito leve. São músicas que realmente são capazes de te fazerem relaxar.\nConfira abaixo:"
        var count = 0
        self.components.forEach { (component) in
            let url = URL(string: anxietyViewModel[count].getMovieUrl())!
            let request = URLRequest(url: url)
            component.title.text = anxietyViewModel[count].getTitle()
            component.videoPlay.load(request)//WithVideoId()
            count += 1
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MusicsView: ViewCodeProtocol {
    func buildViews() {

        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(intro)
        self.components.forEach { (component) in
            containerView.addSubview(component.title)
            containerView.addSubview(component.videoPlay)
        }
        
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
        
        intro.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
        }
        
        title1.snp.makeConstraints { (make) in
            make.top.equalTo(intro.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
        }
    
        videoPlayerView1.snp.makeConstraints { (make) in
            make.top.equalTo(title1.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
            make.height.equalTo(190)
        }
        
        title2.snp.makeConstraints { (make) in
            make.top.equalTo(videoPlayerView1.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
        }
        
        videoPlayerView2.snp.makeConstraints { (make) in
            make.top.equalTo(title2.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
            make.height.equalTo(190)
        }
        
        title3.snp.makeConstraints { (make) in
            make.top.equalTo(videoPlayerView2.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
        }
        
        videoPlayerView3.snp.makeConstraints { (make) in
            make.top.equalTo(title3.snp.bottom).offset(16)
            make.leading.equalTo(containerView.snp.leading).inset(16)
            make.trailing.equalTo(containerView.snp.trailing).inset(16)
            make.height.equalTo(190)
            make.bottom.equalTo(containerView.snp.bottom)
        }
        
//        title4.snp.makeConstraints { (make) in
//            make.top.equalTo(videoPlayerView3.snp.bottom).offset(16)
//            make.leading.equalTo(containerView.snp.leading).inset(16)
//            make.trailing.equalTo(containerView.snp.trailing).inset(16)
//        }
//
//        videoPlayerView4.snp.makeConstraints { (make) in
//            make.top.equalTo(title4.snp.bottom).offset(16)
//            make.leading.equalTo(containerView.snp.leading).inset(16)
//            make.trailing.equalTo(containerView.snp.trailing).inset(16)
//            make.height.equalTo(190)
//        }
//
//        title5.snp.makeConstraints { (make) in
//            make.top.equalTo(videoPlayerView4.snp.bottom).offset(16)
//            make.leading.equalTo(containerView.snp.leading).inset(16)
//            make.trailing.equalTo(containerView.snp.trailing).inset(16)
//        }
//
//        videoPlayerView5.snp.makeConstraints { (make) in
//            make.top.equalTo(title5.snp.bottom).offset(16)
//            make.leading.equalTo(containerView.snp.leading).inset(16)
//            make.trailing.equalTo(containerView.snp.trailing).inset(16)
//            make.height.equalTo(190)
//            make.bottom.equalTo(containerView.snp.bottom)
//        }
        
    }
    
    func extraSettings() {
        
    }
    
    
}

struct Components {
    var title: UILabel
    var videoPlay: WKWebView
}
