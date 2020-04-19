//
//  RoutineDayCollectionViewCell.swift
//  Keep Calm
//
//  Created by Alcides Junior on 17/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

extension String {
    /**
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     
     - Parameter length: A `String`.
     - Parameter trailing: A `String` that will be appended after the truncation.
    
     - Returns: A `String` object.
     */
    func truncate(length: Int, trailing: String = "…") -> String {
        if self.count > length {
            return String(self.prefix(length)) + trailing
        } else {
            return self
        }
    }
}

class RoutineDayCollectionViewCell: UICollectionViewCell {
    
    var shakeEnabled: Bool!
    
    lazy var dayView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var activity: UILabel = {
        
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
    
    lazy var time: UILabel = {
        
        let view = UILabel()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(activityDesc: String, hour: String) {
        activity.text = activityDesc.truncate(length: 10)
        time.text = hour
    }
    
    func shakeIcons() {
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 2
        shakeAnimation.autoreverses = true
        let startAngle: Float = (-2) * 3.14159/180
        let stopAngle = -startAngle
        shakeAnimation.fromValue = NSNumber(value: startAngle as Float)
        shakeAnimation.toValue = NSNumber(value: 3 * stopAngle as Float)
        shakeAnimation.autoreverses = true
        shakeAnimation.duration = 0.2
        shakeAnimation.repeatCount = 10000
        shakeAnimation.timeOffset = 290 * drand48()
        
        let layer: CALayer = self.layer
        layer.add(shakeAnimation, forKey:"shaking")
        shakeEnabled = true
    }
    
    func stopShakingIcons() {
        let layer: CALayer = self.layer
        layer.removeAnimation(forKey: "shaking")
        shakeEnabled = false
    }
}

extension RoutineDayCollectionViewCell: ViewCodeProtocol {
    func buildViews() {
        addSubview(dayView)
        dayView.addSubview(activity)
        dayView.addSubview(time)
    }
    
    func setConstraints() {
        dayView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        activity.snp.makeConstraints { (make) in
            make.top.equalTo(dayView.snp.top).inset(8)
            make.centerX.equalTo(dayView.snp.centerX)
//            make.trailing.equalToSuperview().inset(8)
        }
        
        time.snp.makeConstraints { (make) in
            make.top.equalTo(activity.snp.bottom)
            make.centerX.equalTo(activity.snp.centerX)
        }
    }
    
    func extraSettings() {
        
    }
    
    
}
