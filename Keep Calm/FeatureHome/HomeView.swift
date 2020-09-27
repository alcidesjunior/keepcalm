import SwiftUI

struct HomeView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @State private var showDetails: Bool = false
    @Environment(\.presentationMode) private var presentationMode

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        VStack {
                            self.profileHeader
                        }
                        .frame(height: geometry.size.height / 1.9)

                        self.greeting.padding(.bottom, 2)
                        self.cardPhrase.padding(.horizontal, 20)

                    }
                }
            }
            .navigationBarTitle("Inicio")
        }
    }

    @ViewBuilder
    private var profileHeader: some View {
        KCAvatar(
            profileImage: Image(uiImage: UIImage(contentsOfFile: self.viewModel.getProfileImage) ?? UIImage(named: "profileDefault")!)
        )

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

    private var cardPhrase: some View {
        KCLabel(
            .init(
                text: viewModel.getPhraseOfTheDay,
                style: .phrase,
                color: .init("customBlack")
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            HomeViewTemp(viewModel: .init(home: .init()))
//            .environment(\.colorScheme, .dark)

            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
            HomeView(viewModel: .init(home: .init()))
                .environment(\.colorScheme, .light)
        }
    }
}
