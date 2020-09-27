import SwiftUI

struct RoutineViewTemp: View {
    var model: Model
    @State var isShowForm: Bool = false

    init(model: Model) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                List {
                    Text("")
//                    ForEach(model.weekDays, id: \.name) { weekdays in
//                        Section(header:
//                            KCLabel(
//                                .init(
//                                    text: weekdays.name,
//                                    style: .phrase,
//                                    color: .init("customBlack")
//                                )
//                            )
//                        ) {
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                HStack {
//                                    ForEach(weekdays.days, id: \.activity) { routine in
//                                        KCCard(
//                                            model: .init(
//                                                text: .init(
//                                                    .init(
//                                                        text: "\(routine.activity)\n\(routine.hour)",
//                                                        style: .phrase,
//                                                        color: .init("customWhite")
//                                                    )
//                                                ),
//                                                image: nil,
//                                                background: .init("customBlue")
//                                            )
//                                        )
//                                        .modifier(CardEffect())
//                                        .frame(width: geo.size.width / 3, height: 70)
//                                    }
//
//                                }
//                                .padding()
//                            }
//                            .listRowInsets(EdgeInsets())
//                        }
//                    }
                }
                .sheet(isPresented: self.$isShowForm) {
                    RoutineViewForm(viewModel: .init())
                }
                .introspectTableView { tableView in
                    tableView.showsVerticalScrollIndicator = false
                }
                .navigationBarTitle("Rotina")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isShowForm = true
                    }) {
                        Text("Criar Rotina")
                    }
                )
                .listStyle(GroupedListStyle())
            }
       }
    }
}

struct RoutineViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        RoutineViewTemp(model: .init(routine: Routine()))
    }
}
