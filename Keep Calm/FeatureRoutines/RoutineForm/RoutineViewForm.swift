import Introspect
import SwiftUI
import Combine

struct RoutineViewForm: View {
    @ObservedObject var weekDays = WeekDays()
    @State var currentDate: Date = Date()
    @State var activityName: String = ""
    @State var activityDescription: String = ""
    @StateObject private var keyboardHandler = KeyboardHandler()
    @State private var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    private var viewModel: ViewModel
    private var validForm: Bool {
        activityName.isEmpty || activityDescription.isEmpty || weekDays.hasSomeDaySelected
    }

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
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Fechar")
            },
            trailing:
                Button(action: {
                    saveRoutine()
                    showAlert.toggle()
                }) {
                    Text("Salvar")
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Aviso de rotina"),
                        message: Text("Rotina criada!"),
                        dismissButton: .default(Text("Ok")) {
                            resetFields()
                        }
                    )
                }
                .disabled(validForm)
            )
        }
        .introspectViewController { (viewController) in
            viewController.isModalInPresentation = true
        }
    }

    private func saveRoutine() {
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
    }

    private func resetFields() {
        currentDate = Date()
        activityName = ""
        activityDescription = ""
        weekDays.reset()
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
        @Published var days =
            [
                Day(id: 0,name: "Seg"),
                Day(id: 1,name: "Ter"),
                Day(id: 2,name: "Qua"),
                Day(id: 3,name: "Qui"),
                Day(id: 4,name: "Sex"),
                Day(id: 5,name: "Sab"),
                Day(id: 6,name: "Dom")
            ]

        var hasSomeDaySelected: Bool {
            self.days.filter { $0.selected == true }.isEmpty
        }

        func reset() {
            self.days
                .filter { $0.selected == true}
                .map {
                    $0.selected = false
                    self.objectWillChange.send()
                }
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
