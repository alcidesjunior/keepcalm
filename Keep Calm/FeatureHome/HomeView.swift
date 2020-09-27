import SwiftUI

struct HomeView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @State private var showDetails: Bool = false

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        self.profileHeader
                    }
                    .frame(height: 250)

                    self.greeting.padding(.bottom, 2)
                    self.cardPhrase.padding(.horizontal, 20)

                }
            }
            .navigationBarTitle("Inicio")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.viewModel.loadData()
        }
    }

    @ViewBuilder
    private var profileHeader: some View {
        KCAvatar(
            profileImage: Image(uiImage: UIImage(contentsOfFile: self.viewModel.userData?.profileImage ?? "") ?? UIImage(named: "profileDefault")!)
        )

        KCButton(
            action: {
                self.showDetails = true
            },
            label: Text("Editar Perfil"),
            options: .init(text: .phrase, color: .init("customBlack"))
        )
        .sheet(isPresented: $showDetails) {
            HomeViewDetail()
//                viewModel: .init(
//                            model: .init(
//                                fullName: self.viewModel.userData?.fullName ?? "",
//                                profileImage: self.viewModel.userData?.profileImage ?? ""
//                            )
//                    )
//            )
        }
    }

    private var greeting: some View {
        KCLabel(
            .init(
                text: viewModel.userData?.greeting ?? "",
                style: .greeting,
                color: .init("customBlack")
            )
        )
    }

    private var cardPhrase: some View {
        KCLabel(
            .init(
                text: viewModel.userData?.phraseOfTheDay ?? "",
                style: .phrase,
                color: .init("customBlack")
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewModel: .init(home: .init()))
            .environment(\.colorScheme, .dark)

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
