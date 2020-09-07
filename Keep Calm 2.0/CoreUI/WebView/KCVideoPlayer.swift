import Combine
import SwiftUI

struct KCVideoPlayer: View {
    @ObservedObject var viewModel: KCWebView.ViewModel

    init(viewModel: KCWebView.ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        KCLoading(isShowing: self.$viewModel.isLoading) {
            KCWebView(viewModel: self.viewModel)
                
        }
    }
}

struct KCVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        KCVideoPlayer(viewModel: .init(url: "https://www.youtube.com/watch?v=C5xxrCj8LC0"))
    }
}
