//
//  DetailView.swift
//  H4X0R News
//
//  Created by Aaron Fononi on 09/10/2024.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}
