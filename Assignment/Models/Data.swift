//
//  Data.swift
//  Assignment
//
//  Created by EMPULSE on 27/10/23.
//

import Foundation
struct Issue: Codable {
    let title: String
    let user: User
    let createdAt: String

    private enum CodingKeys: String, CodingKey {
        case title
        case user
        case createdAt = "created_at"
    }
}

struct User: Codable {
    let login: String
    let imageUrl: String


    private enum CodingKeys: String, CodingKey {
        case login
        case imageUrl = "avatar_url"
    }
}
