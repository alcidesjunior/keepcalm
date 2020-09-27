import SwiftUI
import Introspect

struct ExercisesViewTemp: View {
    let viewModel: ViewModel
    @State private var isShowDetail: Bool = false
    @State private var selectedDetail: Activity?

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    KCLabel(
                        .init(
                            text: self.viewModel.exercise.exerciseMotivation,
                            style: .phrase,
                            color: .init("customBlack"),
                            textAlignment: .leading
                        )
                    ).padding()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.viewModel.exercise.activities, id: \.name) { activity in
                                KCCard(
                                    model: .init(
                                        text: .init(
                                            .init(
                                                text: activity.name,
                                                style: .title,
                                                color: .init("customWhite")
                                            )
                                        ),
                                        image: activity.avatar,
                                        background: .init("customBlue")
                                    )
                                )
                                .onTapGesture {
                                    self.isShowDetail = true
                                    self.selectedDetail = activity
                                }
                                .modifier(CardEffect())
                                .frame(width: geometry.size.width / 1.27, height: 160)
                            }
                            Spacer()
                        }
                    .padding()
                    }
                }
                .sheet(isPresented: self.$isShowDetail) {
                    ExerciseDetail(activity: self.$selectedDetail )
                }
                .navigationBarTitle("Exercícios")
            }
        }
    }
}

struct ExercisesViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesViewTemp(viewModel: .init(exercise: .init()))
    }
}
