//
//  ArticleModel.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import Foundation

protocol ArticleModelProtocol{
    func articleRetrieved(_ article: [Article])
}

class ArticleModel{
    var delegate:ArticleModelProtocol?
    
    func getArticles(){
        //Fire off request to the API
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8026b30594af4ae185cafef7b4c06808"
        //Create url obeject
        let url = URL(string: stringUrl)
        //Check if its not nil
        guard url != nil else {
            print("cant create object")
            return
        }
        //Get url session
        let session = URLSession.shared
        //Create data task
       let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    let articles = articleService.articles!
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrieved(articles)
                    }
                } catch{
                    print("Error passing json")
                }
            }
        }
        //Pass in json into article instances and pass to the VC with protocall and delegate parten
        dataTask.resume()
      
    }
}
