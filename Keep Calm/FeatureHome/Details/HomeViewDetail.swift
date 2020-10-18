import Combine
import SwiftUI
import Introspect

struct HomeViewDetail: View {
    @State var name: String = ""
    @State var isShowPicker: Bool = false
    @State var isLoading: Bool = false
    @State var image: Image? = nil
    @State var inputImage: UIImage? = nil
    @State var showAlert: Bool = false
    @ObservedObject private var viewModel: HomeView.ViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: HomeView.ViewModel) {
        self.viewModel = viewModel
    }

    func loadImage() -> Image {
        if let image = inputImage {
            return Image(uiImage: image)
        }
        return Image(uiImage:
                        UIImage(contentsOfFile: self.viewModel.userData?.profileImage ?? "") ?? UIImage(named: "profileDefault")!
        )
    }

    var body: some View {
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
                self.name = self.viewModel.userData?.fullName ?? ""
            })
            .sheet(isPresented: self.$isShowPicker) {
                KCImagePicker(image: self.$inputImage)
            }
            .navigationBarItems(leading:
                Button(action: {
                    self.viewModel.loadData()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Fechar")
                }
            )
        }
        .introspectViewController { (viewController) in
            viewController.isModalInPresentation = true
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
                    showAlert.toggle()
                },
                label: Text("Salvar"),
                options: .init(
                    text: .phrase,
                    background: .init("customGreen"),
                    color: .init("customWhite")
                )
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Aviso de perfil"),
                    message: Text("Dados atualizados!")
                )
            }
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
