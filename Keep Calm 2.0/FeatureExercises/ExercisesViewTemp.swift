import SwiftUI

struct ExercisesViewTemp: View {
    let viewModel: ViewModel
    @State private var isShowDetail: Bool = false

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                VStack {
                    KCLabel(
                        .init(
                            text: self.viewModel.exercise.exerciseMotivation,
                            style: .phrase,
                            color: .init("customBlack"),
                            textAlignment: .leading
                        )
                    )
                }

                VStack {
                    KCButton(
                        action: {
                            self.isShowDetail.toggle()
                    },
                        label: Text("Na Cama"),
                        options: .init(
                            text: .phrase,
                            background: .init("customBlack"),
                            color: .init("customWhite")
                        )
                    )
                    .sheet(isPresented: $isShowDetail) {
                        self.details(activity: self.viewModel.exercise.activities[0])
                    }
                }

                VStack {
                    KCButton(
                        action: {
                            self.isShowDetail.toggle()
                    },
                        label: Text("Alongamento"),
                        options: .init(text: .phrase, background: .init("customBlack"), color: .init("customWhite"))
                    )
                    .sheet(isPresented: $isShowDetail) {
                        self.details(activity: self.viewModel.exercise.activities[1])
                    }
                }
            }
            .navigationBarTitle("Exercícios")
        }
    }
}

extension ExercisesViewTemp {
    private func details(activity: Activity) -> some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(activity.avatar)
                        .resizable()
                        .scaledToFit()
                    KCLabel(
                        .init(
                            text: activity.description,
                            style: .phrase,
                            color: .init("customBlack"),
                            textAlignment: .leading
                        )
                    )
                }.padding()
            }
            .navigationBarTitle(Text(activity.activityName), displayMode: .inline)
        }
    }
}

struct ExercisesViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesViewTemp(viewModel: .init(exercise: .init()))
    }
}
