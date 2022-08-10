//
//  ArticleService.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import Foundation

struct ArticleService: Decodable{
    var totalResults: Int?
    var articles:[Article]?
}
