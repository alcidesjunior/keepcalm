import SwiftUI

struct KCAvatar: View {
    @State var profileImage: Image = Image("profileDefault")
    
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
        KCAvatar()
    }
}
