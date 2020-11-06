//
//  NewsArticle.swift
//  News
//
//  Created by admin on 07/10/20.
//  Copyright © 2020 Sample. All rights reserved.
//

import Foundation

struct NewsArticle: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
    }
}
