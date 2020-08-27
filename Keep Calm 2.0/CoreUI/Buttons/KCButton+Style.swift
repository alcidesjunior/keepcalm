import SwiftUI

extension KCButton {
    struct KCButtonStyle: ButtonStyle {
        private let options: Options

        init(options: Options) {
            self.options = options
        }

        func makeBody(configuration: ButtonStyleConfiguration) -> some View {
            InternalBody(configuration: configuration, options: options)
        }

        struct InternalBody: View {
            let configuration: ButtonStyleConfiguration
            let options: Options

            var body: some View {
                VStack {
                    configuration.label
                        .font(options.text.formatted)
                        .foregroundColor(options.color)
                        .padding(10)
                        .cornerRadius(20)
                        .background(options.background)
                }
                .kcDefaultButtonBehavior(isPressed: configuration.isPressed)
            }
        }
    }
}
