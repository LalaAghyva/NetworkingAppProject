//
//  UserViewModel.swift
//  NetworkingAppProject
//
//  Created by Lala on 17.07.24.
//

import Foundation
import Alamofire

class UserViewModel {
    
    var users = [Users]()
    var url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    func getPostItems(completion: @escaping(()->())) {
        AF.request(url).response { object in
            if object.response?.statusCode == 200 {
                if let data = object.data {
                    do {
                        self.users = try JSONDecoder().decode([Users].self, from: data)
                        completion()
//                        self.userTable.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
