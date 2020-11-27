import Introspect
import SwiftUI

struct FoodView: View {
    private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                Section {
                    Text(self.viewModel.food.motivationalText)
                }

                Section(header: KCLabel(
                        .init(
                            text: self.viewModel.food.vitaminaB.foodCategory,
                            style: .phrase,
                            color: .init("customBlack")
                        )
                    )
                ) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.viewModel.food.vitaminaB.foodType, id: \.id) { row in
                               KCCard(
                                   model: .init(
                                       text: .init(
                                           .init(
                                               text: row.name,
                                               style: .title,
                                               color: .init("customWhite")
                                           )
                                       ),
                                       image: row.foodImage,
                                       background: .init("customBlue")
                                   )
                               )
                               .modifier(CardEffect())
                               .frame(width: 160, height: 160)
                            }
                        }
                        .padding()
                    }
                    .listRowInsets(EdgeInsets())
                }

                Section(header:
                    KCLabel(
                        .init(
                            text: self.viewModel.food.triptofano.foodCategory,
                            style: .phrase,
                            color: .init("customBlack")
                        )
                    )
                ) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.viewModel.food.triptofano.foodType, id: \.id) { row in
                                KCCard(
                                    model: .init(
                                        text: .init(
                                            .init(
                                                text: row.name,
                                                style: .title,
                                                color: .init("customWhite")
                                            )
                                        ),
                                        image: row.foodImage,
                                        background: .init("customBlue")
                                    )
                                )
                                .modifier(CardEffect())
                                .frame(width: 160, height: 160)
                            }
                        }
                        .padding()
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .navigationBarTitle("Alimentação", displayMode: .automatic)
            .introspectTableView { tableView in
                tableView.showsVerticalScrollIndicator = false
            }
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: .init(food: Food()))
    }
}
