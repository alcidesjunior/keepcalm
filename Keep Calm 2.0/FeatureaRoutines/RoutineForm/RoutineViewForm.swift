import Introspect
import SwiftUI

struct RoutineViewForm: View {
    var weekDays = WeekDays()
    @State var isDaySelected: Bool = false

    var body: some View {
        NavigationView {
            List {
                TextField("Atividade", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())

                TextField("Hora", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())

                VStack(alignment: .leading) {
                    Text("Dia:").foregroundColor(Color.secondary)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(weekDays.days, id: \.id) { day in
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
                                .onTapGesture {
                                    day.selected = true
                                    print(day)
                                }
                                .frame(width: 80)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Nova Rotina")
        }
    }
}

struct RoutineViewForm_Previews: PreviewProvider {
    static var previews: some View {
        RoutineViewForm()
    }
}

extension RoutineViewForm {
    struct WeekDays {
        var days: [Day] {
            [
                .init(name: "Seg"),
                .init(name: "Ter"),
                .init(name: "Qua"),
                .init(name: "Qui"),
                .init(name: "Sex"),
                .init(name: "Sab"),
                .init(name: "Dom")
            ]
        }
        struct Day {
            var id = UUID()
            var name: String
            @State var selected: Bool = false
        }
    }
}
