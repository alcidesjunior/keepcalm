//
//  ExerciseCellViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import Foundation

class ExerciseCellViewModel {
    
    var exercise: Exercise
    
    init(exercise: Exercise) {
        
        self.exercise = exercise
    }
    
    func getActivities()->[Activity] {
        
        return self.exercise.activities
    }
    
    func getExerciseMotivation()->String {
        
        return self.exercise.exerciseMotivation
    }
    
    func getActivity(index: Int)->Activity {
        
        let activities = getActivities()
        
        return activities[index]
    }
    
    func countExercises()->Int {
        
        return self.exercise.activities.count
    }
}
