import SwiftUI

struct KCCard: View {
    private var model: Model

    init(model: Model) {
        self.model = model
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                self.model.text
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
            }
            .frame(width: geometry.size.width - 60)
            .padding(20)
            .background(self.model.background)
            .cornerRadius(10)
        }
        .shadow(radius: 4)
    }
}

struct KCCard_Previews: PreviewProvider {
    static var previews: some View {
        KCCard(
            model: .init(
                text: .init(
                    .init(
                        text: "Seja muito bem-vindo!",
                        style: .phrase,
                        color: .white
                    )
                ),
                background: Color.init(UIColor.init(named: "customBlue")!)
            )
        )
    }
}
