//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import UIKit

class ViewController: UIViewController {
    var model = ArticleModel()
    var articles = [Article]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
  }

extension ViewController:ArticleModelProtocol{
    // Article Model Protocol Methods
    func articleRetrieved(_ article: [Article]) {
        self.articles = article
    }
}
