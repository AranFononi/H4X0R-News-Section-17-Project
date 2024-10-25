//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Aaron Fononi on 07/10/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    //Creating an instance of Post Struct as Published to use it in SwiftUI
    @Published var posts = [Post]()
    
    func fetchData() {
        //Creating Session and Decoding returned JSON with JSONDecoder
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let results = try decoder.decode(Results.self, from: data)
                            // Using DispatchQueue to avoid view freeze while loading data
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }
                
                
            }
            task.resume()
        }
        
    }
}
