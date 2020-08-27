import SwiftUI

extension KCLabel {
    struct Model {
        let text: String
        let style: Style
        let color: Color

        init(text: String, style: Style, color: Color) {
            self.text = text
            self.style = style
            self.color = color
        }
    }
}
