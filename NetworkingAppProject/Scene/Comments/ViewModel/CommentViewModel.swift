//
//  CommentViewModel.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import Foundation

class CommentViewModel {
    var postId = 0
    var commentItems = [Comment]()
    
    func getCommentItems(completion: @escaping(()->())) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.commentItems = try JSONDecoder().decode([Comment].self, from: data)
                    DispatchQueue.main.async {
//                        self.table.reloadData()
                    }
                    completion()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
