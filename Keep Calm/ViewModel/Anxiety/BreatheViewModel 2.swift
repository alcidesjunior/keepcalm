//
//  BreatheViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

class AnxietyViewModel {
    
    var anxietyMovie: AnxietyMovie
    
    init(anxietyMovie: AnxietyMovie) {
        self.anxietyMovie = anxietyMovie
    }
    
    func getTitle()->String {
        
        return self.anxietyMovie.title
    }
    
    func getDescription()->String {
        
        return self.anxietyMovie.description
    }
    
    func getMovieUrl()->String {
        
        return self.anxietyMovie.url
    }
}
