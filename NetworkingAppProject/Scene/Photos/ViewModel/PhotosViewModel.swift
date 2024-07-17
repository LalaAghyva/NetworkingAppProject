//
//  PhotosViewModel.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//
import Foundation
import Alamofire

class PhotosViewModel {
    var photos = [Photos]()
    var url = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    func getPostItemsWithRequest(completion: @escaping(()->())) {
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    self.photos = try JSONDecoder().decode([Photos].self, from: data)
                    completion()
                    DispatchQueue.main.async {
//                        self.photosTable.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)

                }
            }
        }.resume()
    }
}
