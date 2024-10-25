//
//  WebView.swift
//  H4X0R News
//
//  Created by Aaron Fononi on 09/10/2024.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    
    //MARK: Showing URL View
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    
    //MARK: Loading URL View
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                uiView.load(URLRequest(url: url))
            }
        }
    }
    
}
