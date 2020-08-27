import SwiftUI

struct KCAvatar: View {
    var profileImage: Image

    init(profileImage: Image) {
        self.profileImage = profileImage
    }
    
    var body: some View {
        VStack {
            profileImage
                .resizable()
                .frame(width: 146, height: 146)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
        }
    }
}

struct KCAvatar_Previews: PreviewProvider {
    static var previews: some View {
        KCAvatar(profileImage: Image("profileDefault"))
    }
}
