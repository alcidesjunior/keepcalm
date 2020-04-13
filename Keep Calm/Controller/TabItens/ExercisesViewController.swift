//
//  ExercisesViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, ControllerProtocol {
    
    var exercise: Exercise!
    var exerciseCellViewModel: ExerciseCellViewModel!
    var exerciseView: ExercisesView!
    
    override func loadView() {
        
        self.exercise = Exercise()
        self.exerciseCellViewModel = ExerciseCellViewModel(exercise: exercise)
        let movitation = self.exerciseCellViewModel.getExerciseMotivation()
        self.exerciseView = ExercisesView(exerciseMotivation: movitation)
        self.view = exerciseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
        exerciseView.collectionView.delegate = self
        exerciseView.collectionView.dataSource = self
    }
    
    func navbarSettings() {
        title = "Exercícios"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backButton
    }

}

extension ExercisesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciseCellViewModel.countExercises()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = exerciseView.collectionView.dequeueReusableCell(withReuseIdentifier: exerciseView.cellID, for: indexPath) as! ExerciseCell
        let activity = exerciseCellViewModel.getActivity(index: indexPath.item)
        cell.setup(activity: activity, viewColor: activity.color)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activity = exerciseCellViewModel.getActivity(index: indexPath.item)
        let details = ExerciseDetailsViewController()
        details.title = activity.activityName
        details.activity = activity
        self.navigationController?.pushViewController(details, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let width = view.frame.size.width * 0.46
        
        let heigth = view.frame.size.height * 0.13//22

        return CGSize(width: width, height: heigth)
    }
    
    
}
