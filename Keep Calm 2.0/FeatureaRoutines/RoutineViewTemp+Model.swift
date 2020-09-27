import Foundation

extension RoutineViewTemp {
    struct Model {
        var routine: Routine
        let scheduleManager = ScheduleManager()
//        var weekDays: [Days] {
//            var weekdays:[Days] = []
//            for number in 0...6 {
//                weekdays.append(
//                    Days(
//                    name: getDayName(number),
//                    days: scheduleManager.getData(byDay: number)?.map { item in
//                        Days.Day(
//                            activity: item.value(forKey: "activity") as! String,
//                            hour: item.value(forKey: "hour") as! String
//                        )
//                    } ?? []
//                    )
//                )
//            }
//            return weekdays
//        }

        init(routine: Routine) {
            self.routine = routine
        }

        struct Days {
            var name: String
            var days: [Day]
            struct Day {
                var activity: String
                var hour: String
            }
        }

        private func getDayName(_ value: Int) -> String {
            switch value {
            case 0:
                return "Segunda-feira"
            case 1:
                return "Terça-feira"
            case 2:
                return "Quarta-feira"
            case 3:
                return "Quinta-feira"
            case 4:
                return "Sexta-feira"
            case 5:
                return "Sábado"
            case 6:
                return "Domingo"
            default:
                return "-"
            }
        }
    }
}
