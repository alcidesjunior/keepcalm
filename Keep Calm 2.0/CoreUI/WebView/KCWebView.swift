import Combine
import Foundation
import SwiftUI
import WebKit

struct KCWebView: UIViewRepresentable {
    @ObservedObject var viewModel: ViewModel
    let webView = WKWebView()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self.viewModel)
    }

    func makeUIView(context: Context) -> some WKWebView {
        self.webView.navigationDelegate = context.coordinator
        guard
            let url = URL(string: self.viewModel.url)
        else {
            return WKWebView()
        }

        let request = URLRequest(url: url)
        self.webView.load(request)
        return self.webView
    }

    func updateUIView(_ uiView: KCWebView.UIViewType, context: Context) {
        
    }
}

extension KCWebView {
    class ViewModel: ObservableObject {
        @Published var url: String
        @Published var isLoading: Bool = true

        init(url: String) {
            self.url = url
        }
    }
}

extension KCWebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        private var viewModel: ViewModel

        init(_ viewModel: ViewModel) {
            self.viewModel = viewModel
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.viewModel.isLoading = false
        }
    }
}
