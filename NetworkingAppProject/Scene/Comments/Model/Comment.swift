//
//  Comment.swift
//  NetworkingAppProject
//
//  Created by Lala on 14.07.24.
//

import Foundation

struct Comment: Codable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
