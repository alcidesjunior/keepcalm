import Combine
import SwiftUI

struct HomeViewDetail: View {
    @State var name: String = ""
    @State var isShowPicker: Bool = false
    @State var image: Image? = nil
    @State var inputImage: UIImage? = nil
    @ObservedObject private var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    func loadImage() -> Image {
        if let image = inputImage {
            return Image(uiImage: image)
        }
        
        return Image(uiImage: UIImage(contentsOfFile: self.viewModel.home.profileImage)!)
    }

    var body: some View {
        Form {
            VStack(alignment: .center) {
                profileHeader
                TextField("Nome", text: $name)
                    .textFieldStyle(PlainTextFieldStyle())
            }

            HStack(alignment: .center) {
                KCButton(
                    action: {
                        self.viewModel.saveData(
                            .init(
                                image: self.$inputImage,
                                firstName: self.name
                            )
                        )
//                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: Text("Salvar"),
                    options: .init(
                        text: .phrase,
                        background: .init("customGreen"),
                        color: .init("customWhite")
                    )
                )
                .frame(minWidth: 0, maxWidth: .infinity)

                KCButton(
                    action: {},
                    label: Text("Cancelar"),
                    options: .init(
                        text: .phrase,
                        background: .init("customRed"),
                        color: .init("customWhite")
                    )
                )
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .sheet(isPresented: $isShowPicker) {
            ImagePicker(image: self.$inputImage)
        }
    }

    @ViewBuilder
    private var profileHeader: some View {
        KCAvatar(profileImage: loadImage()).padding(.top, 10)
        KCButton(
            action: {
                self.isShowPicker = true
            },
            label: Text("Escolher foto"),
            options: .init(text: .phrase)
        )
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    var presentationMode

    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var presentationMode: PresentationMode
        @Binding var image: UIImage?

        init(presentationMode: Binding<PresentationMode>, image: Binding<UIImage?>) {
            _presentationMode = presentationMode
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = uiImage//Image(uiImage: uiImage)
            presentationMode.dismiss()

        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

}

struct HomeViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDetail(viewModel: .init(home: Home()))
    }
}
