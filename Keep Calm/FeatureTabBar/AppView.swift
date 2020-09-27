import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeViewTemp(viewModel: .init(home: Home()))
                .tabItem {
                    Image("home.fill")
                    Text("Inicio")
                }

            RoutineView(viewModel: .init(routine: Routine()))
                .tabItem {
                    Image("routine.fill")
                    Text("Rotina")
                }

            ExercisesView(viewModel: .init(exercise: .init()))
                .tabItem {
                    Image("exercise.fill")
                    Text("Exercícios")
                }

            FoodViewTemp(viewModel: .init(food: Food()))
                .tabItem {
                    Image("food.fill")
                    Text("Alimentação")
                }

            AnxietyView(model: .init(anxiety: Anxiety()))
            .tabItem {
                Image("anxiety.fill")
                Text("Ansiedade")
            }
        }
    }
}