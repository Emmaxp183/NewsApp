//
//  CacheManager.swift
//  NewsApp
//
//  Created by macbook on 10/08/2022.
//

import Foundation

class CacheManager {
    static var  imageDictionary = [String:Data]()
   
    static func saveData(_ url: String,_ imageData: Data){
        // save image data along with the url
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url: String) -> Data? {
        // save image data along with the url
       return imageDictionary[url]
    }
}
