import SwiftUI

struct CardEffect: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .rotation3DEffect(
                    Angle(
                        degrees: Double(geometry.frame(in: .global).minX / -20)
                    ),
                    axis: (
                        x: 0,
                        y: 10.0,
                        z: 0
                    )
                )
        }
    }
}
