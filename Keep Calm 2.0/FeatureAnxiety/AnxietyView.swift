import SwiftUI
import Introspect

struct AnxietyView: View {
    var model: Model
    @State var activity: [Anxiety.AnxietyMovie]?
    @State var isShowDetail: Bool = false

    init(model: Model) {
        self.model = model
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    KCLabel(
                        .init(
                            text: self.model.anxiety.anxietyMotivation,
                            style: .phrase,
                            color: .init("customBlack"),
                            textAlignment: .leading
                        )
                    )
                        .padding()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.model.anxiety.activities, id: \.name) { activity in
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
                                    self.activity = activity.anxietyMovie
                                }
                                .modifier(CardEffect())
                                .frame(width: geometry.size.width / 2.2, height: geometry.size.height / 3)
                            }
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: self.$isShowDetail) {
                    AnxietyDetail(activity: self.$activity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .navigationBarTitle("Ansiedade")
            }
        }
    }
}

struct AnxietyView_Previews: PreviewProvider {
    static var previews: some View {
        AnxietyView(model: .init(anxiety: Anxiety()))
    }
}
