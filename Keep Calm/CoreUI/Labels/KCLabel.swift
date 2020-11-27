import SwiftUI

struct KCLabel: View {
    private let model: Model

    init(_ model: Model) {
        self.model = model
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(model.text)
                .multilineTextAlignment(model.textAlignment)
                .fixedSize(horizontal: false, vertical: true)
                .font(model.style.formatted)
                .foregroundColor(model.color)
        }
    }
}

struct KCLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KCLabel(.init(text: "Olá, bom dia!", style: .greeting, color: .black))
            KCLabel(.init(text: "Olá, bom dia!", style: .title, color: .black))
            KCLabel(.init(text: "Olá, bom dia!", style: .phrase, color: .black))
        }
    }
}
