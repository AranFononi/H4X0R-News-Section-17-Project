//
//  PostData.swift
//  H4X0R News
//
//  Created by Aaron Fononi on 07/10/2024.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
