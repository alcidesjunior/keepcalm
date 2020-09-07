import SwiftUI

struct ExerciseDetail: View {
    @Binding var activity: Activity?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    activity.map {
                        Image($0.avatar)
                            .resizable()
                            .scaledToFit()
                    }

                    activity.map {
                        KCLabel(
                            .init(
                                text: $0.activityName,
                                style: .title,
                                color: .init("customBlack")
                            )
                        )
                            .padding(.vertical)
                    }

                    activity.map {
                        KCLabel(
                            .init(
                                text: $0.description,
                                style: .phrase,
                                color: .init("customBlack"),
                                textAlignment: .leading
                            )
                        )
                    }
                }
                .padding()
            }
            .navigationBarTitle(
                "Exercício",
                displayMode: .inline
            )
        }
    }
}
