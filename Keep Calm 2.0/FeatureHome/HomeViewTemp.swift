import SwiftUI

struct HomeViewTemp: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @State private var showDetails: Bool = false
    @Environment(\.presentationMode) private var presentationMode

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                profileHeader
                greeting
                randomPhraseOfTheDay
            }
            .navigationBarTitle("Início", displayMode: .large)
        }
    }

    @ViewBuilder
    private var profileHeader: some View {
        KCAvatar(
            profileImage: Image(uiImage: UIImage(contentsOfFile: self.viewModel.getProfileImage) ?? UIImage(named: "profileDefault")!)
        ).padding(.top, 10)

        KCButton(
            action: {
                self.showDetails = true
            },
            label: Text("Editar Perfil"),
            options: .init(text: .phrase, color: .init("customBlack"))
        )
        .sheet(isPresented: $showDetails) {
            HomeViewDetail(viewModel: .init(home: self.viewModel.home))
        }
    }

    private var greeting: some View {
        KCLabel(
            .init(
                text: viewModel.getGreeting,
                style: .greeting,
                color: .init("customBlack")
            )
        )
    }

    private var randomPhraseOfTheDay: some View {
        KCCard(
            model: .init(
                text: .init(
                    .init(
                        text: viewModel.getPhraseOfTheDay,
                        style: .phrase,
                        color: .init("customWhite")
                    )
                ),
                background: .init("customBlue")
            )
        )
    }
}

struct HomeViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeViewTemp(viewModel: .init(home: .init()))
            .environment(\.colorScheme, .dark)

            HomeViewTemp(viewModel: .init(home: .init()))
            .environment(\.colorScheme, .light)
        }
    }
}
