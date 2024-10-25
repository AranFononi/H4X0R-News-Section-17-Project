//
//  ContentView.swift
//  H4X0R News
//
//  Created by Aaron Fononi on 07/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("H4X3R NEWS")
            
        }
        .onAppear {
            networkManager.fetchData()
        }
        
    }
}

#Preview {
    ContentView()
}

