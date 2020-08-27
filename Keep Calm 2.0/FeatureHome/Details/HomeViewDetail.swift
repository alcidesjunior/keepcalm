import SwiftUI

struct HomeViewDetail: View {
    @State var nome: String = ""

    var body: some View {
        Form {
            VStack(alignment: .center) {
                profileHeader
                TextField("Nome", text: $nome)
                    .textFieldStyle(PlainTextFieldStyle())
            }


            HStack(alignment: .center) {
                KCButton(
                    action: {},
                    label: .init(
                        .init(
                            text: "Salvar",
                            style: .phrase,
                            color: .init("customWhite")
                        )
                    ),
                    options: .init(
                        text: .phrase,
                        background: .init("customGreen"),
                        color: .init("customWhite")
                    )
                )
                .frame(minWidth: 0, maxWidth: .infinity)

                KCButton(
                    action: {},
                    label: .init(
                        .init(
                            text: "Cancelar",
                            style: .phrase,
                            color: .init("customWhite")
                        )
                    ),
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
    }

    @ViewBuilder
    private var profileHeader: some View {
        KCAvatar().padding(.top, 10)
        KCButton(
            action: {
//                self.showDetails = true
            },
            label: .init(
                .init(
                    text: "Escolher foto",
                    style: .phrase,
                    color: .init("customBlack")
                )
            ),
            options: .init(text: .phrase)
        )
//        .sheet(isPresented: $showDetails) {
////            HomeViewDetail()
//        }
    }
}

struct HomeViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewDetail()
    }
}
