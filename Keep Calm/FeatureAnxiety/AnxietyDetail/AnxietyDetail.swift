import SwiftUI
import WebKit

struct AnxietyDetail: View {
    @Binding var activity: [Anxiety.AnxietyMovie]?
    @ObservedObject var KCWebViewModel = KCWebView.ViewModel(url: "")

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    self.activity.map {
                        ForEach($0, id: \.title) { act in
                            VStack(alignment: .leading) {
                                KCVideoPlayer(viewModel: .init(url: act.url))
                                .frame(
                                        width: geometry.size.width,
                                        height: geometry.size.height / 3
                                )

                                KCLabel(
                                    .init(
                                        text: act.title,
                                        style: .title,
                                        color: .init("customBlack")
                                    )
                                ).padding(.horizontal)

                                KCLabel(
                                    .init(
                                        text: act.description,
                                        style: .phrase,
                                        color: .init("customBlack"),
                                        textAlignment: .leading
                                    )
                                ).padding(.horizontal)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                .navigationBarTitle("Ansiedade", displayMode: .inline)
            }
        }
    }
}

struct AnxietyDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnxietyDetail(
            activity: .constant(
                .init([.init(title: "Testeee", description: "seem", url: "https://www.youtube.com/watch?v=Y9sjTYVywi8")])
            )
        )
    }
}
