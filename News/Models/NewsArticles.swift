//
//  NewsArticles.swift
//  News
//
//  Created by admin on 07/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation

struct NewsArticles: Codable {
    let totalResults: Int
    let articles: [NewsArticle]
    
    enum CodingKeys: String, CodingKey {
        case totalResults
        case articles
    }
}
