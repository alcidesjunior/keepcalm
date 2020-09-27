import SwiftUI
import Combine

extension HomeView {
    final class ViewModel: ObservableObject {
        private var home: Home
        @Published var userData: UserData?

        init(home: Home) {
            self.home = home
        }

        func loadData() {
            self.userData = UserData(
                profileImage: getProfileImage,
                greeting: self.getGreeting,
                phraseOfTheDay: self.getPhraseOfTheDay,
                fullName: self.fullName
            )
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
