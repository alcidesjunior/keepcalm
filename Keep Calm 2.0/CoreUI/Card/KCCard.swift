import SwiftUI

struct KCCard: View {
    private var model: Model

    init(model: Model) {
        self.model = model
    }

    var body: some View {
            VStack {
                self.model.image.map {
                    Image($0)
                    .resizable()
                    .scaledToFit()
                }
                self.model.text
                    .padding(12)
                    .shadow(radius: 10)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            .background(self.model.background)
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}

struct KCCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KCCard(
                model: .init(
                    text: .init(
                        .init(
                            text: "Meditação",
                            style: .title,
                            color: .init("customWhite")
                        )
                    ),
                    image: "breath",
                    background: Color.init(UIColor.init(named: "customBlue")!)
                )
            )
                .colorScheme(.dark)

            KCCard(
                model: .init(
                    text: .init(
                        .init(
                            text: "Música",
                            style: .title,
                            color: .init("customWhite")
                        )
                    ),
                    image: "music",
                    background: Color.init(UIColor.init(named: "customBlue")!)
                )
            )
        }
    }
}
