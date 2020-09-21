//import SwiftUI
//
//struct KCTextView: View {
//    private var model: Model
//
//    init(model: Model) {
//        self.model = model
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            TextView(text: self.model.$text)
//                .border(
//                    Color.init("customBlack"),
//                    width: 1
//                )
//                .frame(
//                    width: self.model.width ?? geometry.size.width - 32,
//                    height: self.model.height
//                )
//                .padding()
//        }
//    }
//}
//
//struct KCTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        KCTextView(
//            model: .init(
//                text: .constant("Texto"),
//                width: nil,
//                height: 70
//            )
//        )
//    }
//}
