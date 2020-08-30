import SwiftUI

struct KCCard: View {
    private var model: Model

    init(model: Model) {
        self.model = model
    }

    var body: some View {
            VStack {
                self.model.text.padding(12)
            }
//            .edgesIgnoringSafeArea(.all)
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            .background(self.model.background)
            .cornerRadius(10)
            .shadow(radius: 4)
    }
}

struct KCCard_Previews: PreviewProvider {
    static var previews: some View {
        KCCard(
            model: .init(
                text: .init(
                    .init(
                        text: "Seja muito bem-vindo! hoje teremos uma bela frase do dia para você se motivar.",
                        style: .phrase,
                        color: .white
                    )
                ),
                background: Color.init(UIColor.init(named: "customBlue")!)
            )
        )
    }
}
