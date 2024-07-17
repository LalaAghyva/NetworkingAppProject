//
//  PostViewModel.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import Foundation
import Alamofire

class PostViewModel {
    
    var items = [Post]()
    var url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    func getPostItems(completion: @escaping(()->())) {
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.items = try JSONDecoder().decode([Post].self, from: data)
                    completion()
                    DispatchQueue.main.async {
//                        self.table.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
