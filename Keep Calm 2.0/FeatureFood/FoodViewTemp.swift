import Introspect
import SwiftUI

struct FoodViewTemp: View {
    private(set) var viewModel: ViewModel

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
                                VStack {
                                    Image(row.foodImage)
                                        .resizable()
                                        .frame(width: 160,height: 160)
                                    KCLabel(.init(text: row.name, style: .phrase, color: .init("customBlack")))
                                }
                            }
                        }
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
                                VStack {
                                    Image(row.foodImage)
                                        .resizable()
                                        .frame(width: 160,height: 160)
                                    KCLabel(.init(text: row.name, style: .phrase, color: .init("customBlack")))
                                }
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }
                    .navigationBarTitle("Alimentação", displayMode: .automatic)
            }
            .introspectTableView { tableView in
                tableView.showsVerticalScrollIndicator = false
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct FoodViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        FoodViewTemp(viewModel: .init(food: Food()))
    }
}
