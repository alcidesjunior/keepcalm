import SwiftUI
import Combine

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published private var home: Home
        @Published var userData: UserData? = nil

        init(home: Home) {
            self.home = home
            loadData()
        }

        func loadData() {
            self.userData = UserData(
                profileImage: getProfileImage,
                greeting: self.getGreeting,
                phraseOfTheDay: self.getPhraseOfTheDay,
                fullName: self.fullName
            )
        }

        func saveData(_ userData: saveData) {
            if let imageData = userData.image?.pngData() {
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let url = documents.appendingPathComponent("profileImage.png")

                do {
                    try imageData.write(to: url)
                    UserDefaults.standard.set(url.relativePath, forKey: "userProfileImage")
                } catch {
                    print("Unable to Write Data to Disk (\(error))")
                }
            }
            UserDefaults.standard.set(userData.firstName, forKey: "firstName")
        }

        struct saveData {
            @Binding var image: UIImage?
            let firstName: String
        }

        private var getProfileImage: String {
            return self.home.profileImage
        }

        private var greetingString: String {
            let date = NSDate()
            var greeting = ""
            let calendar = NSCalendar.current
            let currentHour = calendar.component(.hour, from: date as Date)
            let hourInt = Int(currentHour.description) ?? 00

            switch hourInt {
            case 0 ... 11:
                greeting = "Bom dia"
            case 12 ... 17:
                greeting = "Boa tarde"
            default:
                greeting = "Boa noite"
            }

            return greeting
        }

        private var getGreeting: String {
            if fullName == "" {
                return greetingString+"!"
            }
            return greetingString+",\n"+fullName+"!"
        }

        private var getPhraseOfTheDay: String {
            let today = Int.random(in: 0...(self.home.phraseOfTheDay.count-1))
            return self.home.phraseOfTheDay[today]
        }

        private var fullName: String {
            return self.home.fullName
        }

        struct UserData {
            var profileImage: String
            var greeting: String
            var phraseOfTheDay: String
            var fullName: String
        }
    }

}
