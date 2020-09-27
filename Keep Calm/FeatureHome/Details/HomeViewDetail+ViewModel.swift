import Combine
import SwiftUI

extension HomeViewDetail {
    struct ViewModel {
        private var model: Home

        init(model: Home) {
            self.model = model
        }

        func saveData(_ userData: UserData) {
            if let imageData = userData.image?.pngData() {
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let url = documents.appendingPathComponent("profileImage.png")

                do {
                    // Write to Disk
                    try imageData.write(to: url)
                    // Store URL in User Defaults
                    UserDefaults.standard.set(url.relativePath, forKey: "userProfileImage")

                } catch {
                    print("Unable to Write Data to Disk (\(error))")
                }
            }

            UserDefaults.standard.set(userData.firstName, forKey: "firstName")
        }

        var profileImage: String {
            model.profileImage
        }

        var fullName: String {
            model.fullName
        }

        struct Model {
            let fullName: String
            let profileImage: String
        }

        struct UserData {
            @Binding var image: UIImage?
            let firstName: String
        }
    }
}
