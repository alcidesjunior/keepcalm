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
                        .padding(10)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity
                        )
                        .foregroundColor(options.color)
                        .background(options.background)
                }
                .cornerRadius(200)
                .kcDefaultButtonBehavior(isPressed: configuration.isPressed)
            }
        }
    }
}
