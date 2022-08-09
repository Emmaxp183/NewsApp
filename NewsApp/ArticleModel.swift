//
//  ArticleModel.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import Foundation

protocol ArticleModelProtocol{
    func articleRetrieved(_article:[Article])
}

class ArticleModel{
    var delegate:ArticleModelProtocol?
    
    func getArticles(){
        //Fire off request to the API
        
        //Pass in json into article instances and pass to the VC with protocall and delegate parten
        
        delegate?.articleRetrieved(_article: [Article]())
    }
}
