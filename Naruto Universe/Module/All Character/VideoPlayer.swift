//
//  VideoPlayer.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 29/04/24.
//

import SwiftUI
import WebKit
import AVKit
import UIKit
struct WebViewPlayer:UIViewRepresentable{
    let htmlContent:URL
    func makeUIView(context: Context) -> WKWebView {
        let webView=WKWebView()
//        webView.loadHTMLString(htmlContent, baseURL: nil)
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request=URLRequest(url: htmlContent)
        uiView.load(request)
    }
}
struct VideoPlayerView: View {
    let embedCode="https://www.youtube.com"
    var body: some View {
            WebViewPlayer(htmlContent: URL(string: embedCode)!)
    }
}

//#Preview {
//    VideoPlayer()
//}


extension UIScreen{
    static let screenWidth=UIScreen.main.bounds.width
    static let screenHeight=UIScreen.main.bounds.height
}
