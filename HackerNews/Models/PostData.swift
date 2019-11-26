//
//  PostData.swift
//  HackerNews
//
//  Created by Tim Newton on 11/26/19.
//  Copyright © 2019 EduServe, Inc. All rights reserved.
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
