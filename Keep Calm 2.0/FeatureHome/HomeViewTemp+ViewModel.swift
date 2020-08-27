import Combine
import SwiftUI

extension HomeViewTemp {
    final class ViewModel: ObservableObject {
        var home: Home

        init(home: Home) {
            self.home = home
        }

        var getProfileImage: String {
            return self.home.profileImage
        }

        var greetingString: String {
            let date = NSDate()
            var greeting = ""
            let calendar = NSCalendar.current
            let currentHour = calendar.component(.hour, from: date as Date)
            let hourInt = Int(currentHour.description)!

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

        var getGreeting: String {
            if getFirstName == "" {
                return greetingString+"!"
            }
            return greetingString+", "+getFirstName+"!"
        }

        var getPhraseOfTheDay: String {
            let qtd = self.home.phraseOfTheDay.count-1
            let today = Int.random(in: 0...qtd)
            return self.home.phraseOfTheDay[today]
        }

        var getFirstName: String {
            return self.home.firstName
        }

        var getLastName: String {
            return self.home.lastName
        }
    }

}
