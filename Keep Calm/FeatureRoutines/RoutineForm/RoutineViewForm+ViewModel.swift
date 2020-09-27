import SwiftUI

extension RoutineViewForm {
    struct ViewModel {
        private let scheduleManager = ScheduleManager()

        func save(routine: RoutineData) {
            self.scheduleManager.create(scheduleElement: routine)
            print("SALVO 🍆")
        }

        func dateToTime(from date: Date) -> String {
            let calendar = Calendar.current
            let currentHour = calendar.component(.hour, from: date) < 9 ? "0\(calendar.component(.hour, from: date))" : "\(calendar.component(.hour, from: date))"
            let currentMinute = calendar.component(.minute, from: date) < 9 ? "0\(calendar.component(.minute, from: date))" : "\(calendar.component(.minute, from: date))"
            return "\(currentHour):\(currentMinute)"
        }
    }
}
