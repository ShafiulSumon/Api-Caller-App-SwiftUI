//
//  Model.swift
//  API-Caller-SwiftUI
//
//  Created by ShafiulAlam-00058 on 3/24/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Hashable, Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Hashable, Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

// MARK: - Source
struct Source: Hashable, Codable {
    var id: String?
    var name: String?
}
