////
////  ProfileViewController.swift
////  Keep Calm
////
////  Created by Alcides Junior on 13/04/20.
////  Copyright © 2020 all seeds labs. All rights reserved.
////
//
//import UIKit
//
//class ProfileViewController: UIViewController {
//    
//    let profileView = ProfileView()
//    var imagePicker = UIImagePickerController()
//    var delegate: SavedDataProtocol? = nil
//    
//    override func loadView() {
//        self.view = profileView
//    }
//
//    override func viewDidLayoutSubviews() {
//        self.profileView.profileImage.makeRounded()
//    }
//    
//    @objc func dismissProfile(){
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    @objc func changeImgButtonAction() {
//        
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            
//            imagePicker.delegate = self
//            imagePicker.sourceType = .photoLibrary
//            imagePicker.allowsEditing = false
//            
//            present(imagePicker, animated: true, completion: nil)
//        }
//    }
//    
//    @objc func saveDataAction() {
//        delegate?.didUpdateData()
//        let firstName:String = profileView.userNameInput.text!
//        
//        if firstName.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
//        
//            if let imageData = profileView.profileImage.image?.pngData(){
//                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//                let url = documents.appendingPathComponent("profileImage.png")
//                
//                do {
//                    // Write to Disk
//                    try imageData.write(to: url)
//                    
//                    // Store URL in User Defaults
//                    UserDefaults.standard.set(url.relativePath, forKey: "userProfileImage")
//
//                } catch {
//                    print("Unable to Write Data to Disk (\(error))")
//                }
//            }
//            UserDefaults.standard.set(firstName, forKey: "firstName")
//            
//            self.dismiss(animated: true, completion: nil)
//        }else {
//            
//            let alert = UIAlertController(title: "Atenção", message: "Preencha o campo nome.", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Entendi", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemBackground
//        self.profileView.cancelButton.addTarget(self, action: #selector(dismissProfile), for: .touchUpInside)
//        self.profileView.changeProfileButton.addTarget(self, action: #selector(changeImgButtonAction), for: .touchUpInside)
//        self.profileView.saveButton.addTarget(self, action: #selector(saveDataAction), for: .touchUpInside)
//        self.profileView.userNameInput.delegate = self
//    }
//    
//
//}
//
//extension ProfileViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.profileView.userNameInput.endEditing(true)
//    }
//}
//
//extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            
//            self.profileView.profileImage.image = image
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//}
