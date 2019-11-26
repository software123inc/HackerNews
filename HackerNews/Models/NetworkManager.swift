//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Tim Newton on 11/26/19.
//  Copyright © 2019 EduServe, Inc. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Session Task error: \(error.localizedDescription)")
                }
                else if let data = data {
                    let decoder = JSONDecoder()
                    
                    do {
                        let results = try decoder.decode(Results.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    }
                    catch {
                        print("Decoding error: \(error.localizedDescription)")
                    }
                    
                }
            }
            
            task.resume()
        }
    }
}
