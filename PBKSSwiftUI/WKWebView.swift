//
//  WKWebView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 26/06/24.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
//    let url: URL
//    var html: String? = ""
    var htmlString: String


    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
//        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // This space can be left blank
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Webview started loading.")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Webview finished loading.")
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Webview failed with error: \(error.localizedDescription)")
        }
    }
}

