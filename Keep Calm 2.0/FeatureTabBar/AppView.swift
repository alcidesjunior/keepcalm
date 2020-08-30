import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeViewTemp(viewModel: .init(home: Home()))
                .tabItem {
                    Image("home.fill")
                    Text("Inicio")
                }

            HomeViewTemp(viewModel: .init(home: Home()))
                .tabItem {
                    Image("routine.fill")
                    Text("Rotina")
                }

            HomeViewTemp(viewModel: .init(home: Home()))
                .tabItem {
                    Image("exercise.fill")
                    Text("Exercícios")
                }

            FoodViewTemp(viewModel: .init(food: Food()))
                .tabItem {
                    Image("food.fill")
                    Text("Alimentação")
                }

            HomeViewTemp(viewModel: .init(home: Home()))
            .tabItem {
                Image("anxiety.fill")
                Text("Ansiedade")
            }
        }
    }
}
