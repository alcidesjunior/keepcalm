import Combine
import SwiftUI

extension HomeViewDetail {
    final class ViewModel: ObservableObject {
        @Published var home: Home

        init(home: Home) {
            self.home = home
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

        struct UserData {
            @Binding var image: UIImage?
            let firstName: String
        }
    }
}
