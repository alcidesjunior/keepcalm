import Combine
import SwiftUI

struct HomeViewDetail: View {
    @State var name: String = ""
    @State var isShowPicker: Bool = false
    @State var isLoading: Bool = false
    @State var image: Image? = nil
    @State var inputImage: UIImage? = nil
    private var viewModel: ViewModel = ViewModel(model: Home())
    @Environment(\.presentationMode) var presentationMode
 
//    init(viewModel: ViewModel = Home()) {
//        self.viewModel = viewModel
//    }

    func loadImage() -> Image {
        if let image = inputImage {
            return Image(uiImage: image)
        }
        return Image(uiImage: UIImage(contentsOfFile: self.viewModel.profileImage) ?? UIImage(named: "profileDefault")!)
    }

    var body: some View {
        KCLoading(isShowing: $isLoading) {
            NavigationView {
                Form {
                    VStack(alignment: .center) {
                        self.profileHeader
                    }

                    HStack(alignment: .center) {
                        self.buttons
                    }
                    .padding(.vertical, 40)
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .navigationBarTitle("Perfil", displayMode: .large)
                .onAppear(perform: {
                    self.name = self.viewModel.fullName
                })
                .sheet(isPresented: self.$isShowPicker) {
                    KCImagePicker(image: self.$inputImage)
                }
            }
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
            options: .init(text: .phrase, color: .init("customBlack"))
        )

        TextField("Nome", text: self.$name)
            .textFieldStyle(PlainTextFieldStyle())
    }

    @ViewBuilder
    private var buttons: some View {
            KCButton(
                action: {
                    self.isLoading.toggle()
                    self.viewModel.saveData(
                        .init(
                            image: self.$inputImage,
                            firstName: self.name
                        )
                    )
                    self.presentationMode.wrappedValue.dismiss()
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
                action: { self.presentationMode.wrappedValue.dismiss() },
                label: Text("Cancelar"),
                options: .init(
                    text: .phrase,
                    background: .init("customRed"),
                    color: .init("customWhite")
                )
            )
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

//struct HomeViewDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewDetail(viewModel: .init(home: Home())).colorScheme(.light)
//    }
//}
