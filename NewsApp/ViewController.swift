//
//  ViewController.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table view delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
  }

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        //Get table view 
        let article = articles[indexPath.row]
        //Customize cell
        cell.displayArticle(article)
        //Return the cell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
extension ViewController:ArticleModelProtocol{
    // Article Model Protocol Methods
    func articleRetrieved(_ article: [Article]) {
        self.articles = article
        //Refresh data
        tableView.reloadData()
    }
}

