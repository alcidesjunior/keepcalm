import SwiftUI

struct KCButton: View {
    var action: () -> Void
    var label: Text
    var options: Options

    var body: some View {
        Button(
            action: action,
            label: { label }
        )
        .buttonStyle(KCButtonStyle(options: options))
    }
}

struct KCButton_Previews: PreviewProvider {
    static var previews: some View {
        KCButton(
            action: {
                print("oi")
            },
            label: Text("Botão"),
            options: .init(text: .phrase, background: .blue, color: .init("customBlack"))
        )
    }
}

extension View {
    func kcDefaultButtonBehavior(isPressed: Bool) -> some View {
        self
            .animation(.none)
            .opacity(isPressed ? 0.85 : 1.0)
            .scaleEffect(isPressed ? 0.99 : 1.0, anchor: .center)
    }
}

struct Options {
    let text: Style
    let color: Color
    let background: Color
    let height: CGFloat

    init(text: Style, background: Color = .clear, color: Color = .black, height: CGFloat = 50) {
        self.text = text
        self.color = color
        self.background = background
        self.height = height
    }
}
