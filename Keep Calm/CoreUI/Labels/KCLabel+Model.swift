import SwiftUI

extension KCLabel {
    struct Model {
        let text: String
        let style: Style
        let color: Color
        let textAlignment: TextAlignment

        init(text: String, style: Style, color: Color, textAlignment: TextAlignment = .center) {
            self.text = text
            self.style = style
            self.color = color
            self.textAlignment = textAlignment
        }
    }
}
