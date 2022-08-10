//
//  Article.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import Foundation

struct Article: Decodable{
   
    var author: String?
    var title: String?
    var discribtion: String?
    var url: String?
    var urlToImage: String?
    var published: String?

}
