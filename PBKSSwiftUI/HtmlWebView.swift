//
//  HtmlWebView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 26/06/24.
//

import WebKit
import SwiftUI

struct HtmlWebView: UIViewRepresentable {
    var htmlString: String
    @Binding var contentHeight: CGFloat


    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: HtmlWebView

        init(_ parent: HtmlWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Webview started loading.")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Webview finished loading.")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
                    DispatchQueue.main.async {
                        self.parent.contentHeight = height as! CGFloat
                    }
                })
            }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Webview failed with error: \(error.localizedDescription)")
        }
    }
}

