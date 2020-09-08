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
                    Section(header:
                        KCLabel(
                            .init(
                                text: "Segunda-feira",
                                style: .phrase,
                                color: .init("customBlack")
                            )
                        )
                    ) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                               KCCard(
                                   model: .init(
                                       text: .init(
                                           .init(
                                               text: "Teste\n12:14",
                                               style: .phrase,
                                               color: .init("customWhite")
                                           )
                                       ),
                                       image: nil,
                                       background: .init("customBlue")
                                   )
                               )
                               .modifier(CardEffect())
                               .frame(width: geo.size.width / 3, height: 50)
                            }
                            .padding()
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                .sheet(isPresented: self.$isShowForm) {
                    RoutineViewForm()
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
