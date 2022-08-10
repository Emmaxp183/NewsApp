//
//  ArticleCell.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var Articleheadline: UILabel!
    var articleToDisplay:Article?
    
    func displayArticle(_ articles: Article) {
        articleToDisplay = articles
        Articleheadline.text = articleToDisplay!.title
        //Download & Display the image
        
        //Check if article has image
        guard articleToDisplay!.urlToImage != nil else{
            return
        }
      
        //Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        //Check before cache manager before downloading any image data
        if let imageDate = CacheManager.retrieveData(urlString){
            articleImage.image = UIImage(data: imageDate)
            return
        }
        
        //Create the url
        let url = URL(string: urlString)
       
        //check that url isnt nil
        guard url != nil else {return print("couldnt create url object")}
        
        //Get urlSession
        let session = URLSession.shared
       
        //Create dataTask
        let dataTask = session.dataTask(with: url!) { data, response, error in
             if error == nil && data != nil{
                 //Save data
                 CacheManager.saveData(urlString, data!)
                DispatchQueue.main.async {
                    self.articleImage.image = UIImage(data: data!)
                }
            }
        }
        //Kick off the datatask
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
