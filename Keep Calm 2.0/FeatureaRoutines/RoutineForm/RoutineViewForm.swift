import Introspect
import SwiftUI
import Combine

struct RoutineViewForm: View {
    @ObservedObject var weekDays = WeekDays()
    @State var currentDate: Date = Date()
    @State var activityName: String = ""
    @State var activityDescription: String = ""
    @StateObject private var keyboardHandler = KeyboardHandler()
    private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Atividade:")
                        .foregroundColor(Color.gray)
                    TextField("", text: $activityName)
                        .textFieldStyle(PlainTextFieldStyle())
                }

                DatePicker(
                    selection: $currentDate,
                    displayedComponents: .hourAndMinute,
                    label: {
                        Text("Hora:")
                            .foregroundColor(Color.gray)
                    }
                )

                Text("Dia:")
                    .foregroundColor(Color.secondary)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(weekDays.days, id: \.id) { day in
                            self.weekDay(day: day)
                            .onTapGesture {
                                day.selected.toggle()
                                self.weekDays.objectWillChange.send()
                            }
                        }
                    }
                }

                Text("Descreva:")
                    .foregroundColor(Color.gray)
                TextEditor(text: $activityDescription)
                    .frame(height: 100)
            }
            .navigationBarTitle("Nova Rotina")
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.save(
                        routine: .init(
                            activity: activityName,
                            hour: self.viewModel.dateToTime(from: currentDate),
                            activityDescription: activityDescription,
                            day: weekDays
                                .days
                                .filter { $0.selected == true }
                                .map { .init(day: $0.id) }
                        )
                    )
                }) {
                    Text("Salvar")
                }
            )
        }
    }

    private func weekDay(day: WeekDays.Day) -> some View {
        KCCard(
            model: .init(
                text: .init(
                    .init(
                        text: day.name,
                        style: .phrase,
                        color: .init("customWhite")
                    )
                ),
                image: nil,
                background: .init(day.selected ? "customBlue" : "customBlack")
            )
        )
        .frame(width: 80)
    }
}

struct RoutineViewForm_Previews: PreviewProvider {
    static var previews: some View {
        RoutineViewForm(viewModel: .init())
    }
}

extension RoutineViewForm {
    class WeekDays: ObservableObject {
        @Published var days = [Day]()

        init() {
            self.days =
            [
                .init(id: 1,name: "Seg"),
                .init(id: 2,name: "Ter"),
                .init(id: 3,name: "Qua"),
                .init(id: 4,name: "Qui"),
                .init(id: 5,name: "Sex"),
                .init(id: 6,name: "Sab"),
                .init(id: 7,name: "Dom")
            ]
        }

        class Day: ObservableObject, Identifiable {
            var id: Int
            var name: String
            @Published var selected: Bool

            init(id: Int, name: String, selected: Bool = false) {
                self.id = id
                self.name = name
                self.selected = selected
            }
        }
    }
}
