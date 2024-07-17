//
//  AlbumsViewModel.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import Foundation
import Alamofire

class AlbumsViewModel {
    var albums = [Albums]()
    var url = URL(string: "https://jsonplaceholder.typicode.com/albums")
    
    func getPostItem(completion: @escaping(()->())) {
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.albums = try JSONDecoder().decode([Albums].self, from: data)
                    completion()
                    DispatchQueue.main.async {
//                        self.albumsTable.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
