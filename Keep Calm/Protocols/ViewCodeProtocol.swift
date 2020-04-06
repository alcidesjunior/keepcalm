//
//  ViewCode.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

protocol ViewCodeProtocol {
    
    func buildViews()
    func setConstraints()
    func extraSettings()
    func setupViews()
}

extension ViewCodeProtocol{
    
    func setupViews(){
        buildViews()
        setConstraints()
        extraSettings()
    }
}
