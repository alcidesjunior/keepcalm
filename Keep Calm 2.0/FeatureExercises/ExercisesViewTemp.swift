import SwiftUI

struct ExercisesViewTemp: View {
    let viewModel: ViewModel
    @State private var isShowDetail: Bool = false
    @State private var selectedDetail: Activity?

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                KCLabel(
                    .init(
                        text: self.viewModel.exercise.exerciseMotivation,
                        style: .phrase,
                        color: .init("customBlack"),
                        textAlignment: .leading
                    )
                )

                ForEach(self.viewModel.exercise.activities, id: \.activityName) { activity in
                    KCButton(
                        action: {
                            self.isShowDetail = true
                            self.selectedDetail = activity
                        },
                        label: Text(activity.activityName),
                        options: .init(
                            text: .phrase,
                            background: .init("customBlack"),
                            color: .init("customWhite")
                        )
                    )
                }
            }
            .sheet(isPresented: self.$isShowDetail) {
                ExerciseDetail(activity: self.$selectedDetail )
            }
            .navigationBarTitle("Exercícios")
        }
    }
}

struct ExercisesViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesViewTemp(viewModel: .init(exercise: .init()))
    }
}
