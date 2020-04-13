//
//  AnxietyViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 08/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

class AnxietyCellViewModel {
    
    var anxiety: Anxiety
    
    init(anxiety: Anxiety) {
        
        self.anxiety = anxiety
    }
    
    func getActivities()->[AnxietyActivity] {
        
        return self.anxiety.activities
    }
    
    func getAnxietyMotivation()->String {
        
        return self.anxiety.anxietyMotivation
    }
    
    func getActivity(index: Int)->AnxietyActivity {
        
        let activities = getActivities()
        
        return activities[index]
    }
    
    func getAnxietyMovies(anxietyActivity: AnxietyActivity)->[AnxietyMovie] {
        
        return anxietyActivity.anxietyMovie
    }
    
    func countAnxiety()->Int {
        
        return self.anxiety.activities.count
    }
}
