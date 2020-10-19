//
//  ModelJson.swift
//  MVPCallAPI
//
//  Created by nguyen gia huy on 14/10/2020.
//

import Foundation
struct ModelJson: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
       
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
    }
}

