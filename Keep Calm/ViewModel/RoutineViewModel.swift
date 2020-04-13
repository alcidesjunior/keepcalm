//
//  RoutineViewModel.swift
//  Keep Calm
//
//  Created by Alcides Junior on 12/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class RoutineViewModel {
    
    var routine: Routine
    
    init(routine: Routine) {
        
        self.routine = routine
    }
    
    func getRoutineDescription()->String {
        
        return self.routine.routineDescription
    }
    
    func getRoutineImage()->UIImage {
        
        return self.routine.routineImage
    }
}
