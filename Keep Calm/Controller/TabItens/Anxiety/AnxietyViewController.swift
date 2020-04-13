//
//  AnxietyViewController.swift
//  Keep Calm
//
//  Created by Alcides Junior on 05/04/20.
//  Copyright © 2020 all seeds labs. All rights reserved.
//

import UIKit

class AnxietyViewController: UIViewController, ControllerProtocol {
    
    
    var anxiety: Anxiety!
    var anxietyCellViewModel: AnxietyCellViewModel!
    var anxietyView: AnxietyView!
    
    override func loadView() {
        
        self.anxiety = Anxiety()
        self.anxietyCellViewModel = AnxietyCellViewModel(anxiety: anxiety)
        let movitation = self.anxietyCellViewModel.getAnxietyMotivation()
        self.anxietyView = AnxietyView(anxietyMotivation: movitation)
        self.view = anxietyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navbarSettings()
        self.view.backgroundColor = .systemBackground
        anxietyView.collectionView.delegate = self
        anxietyView.collectionView.dataSource = self
    }

    func navbarSettings() {
        title = "Ansiedade"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "customBlue")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.title,.foregroundColor: UIColor.white]
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backButton
    }
}

extension AnxietyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anxietyCellViewModel.countAnxiety()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = anxietyView.collectionView.dequeueReusableCell(withReuseIdentifier: anxietyView.cellID, for: indexPath) as! AnxietyCell
        let activity = anxietyCellViewModel.getActivity(index: indexPath.item)
        cell.setup(activity: activity, viewColor: activity.color)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activity = anxietyCellViewModel.getActivity(index: indexPath.item)
        let anxietyMovie = anxietyCellViewModel.getAnxietyMovies(anxietyActivity: activity)
        
        switch indexPath.item {
        case 0:
            let breatheVC = BreatheViewController()
            breatheVC.anxietyMovie = anxietyMovie
            breatheVC.title = "Respiração"
            self.navigationController?.pushViewController(breatheVC, animated: true)
        case 1:
            let teaVC = TeaViewController()
            teaVC.anxietyMovie = anxietyMovie
            teaVC.title = "Chás"
            self.navigationController?.pushViewController(teaVC, animated: true)
        case 2:
            let musicVC = MusicViewController()
            musicVC.anxietyMovie = anxietyMovie
            musicVC.title = "Músicas"
            self.navigationController?.pushViewController(musicVC, animated: true)
        default:
            let breatheVC = BreatheViewController()
            breatheVC.anxietyMovie = anxietyMovie
            breatheVC.title = "Meditação"
            self.navigationController?.pushViewController(breatheVC, animated: true)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width * 0.46
        let heigth = view.frame.size.height * 0.13

        return CGSize(width: width, height: heigth)
    }
    
    
}
