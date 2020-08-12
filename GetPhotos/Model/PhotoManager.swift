//
//  APIManager.swift
//  GetPhotos
//
//  Created by Mobile Apps Team on 8/11/20.
//  Copyright © 2020 anshu vij. All rights reserved.
//

import Foundation

struct PhotoManager {
    let photoListUrl = "https://picsum.photos/list"
    
  
    var delegate : PhotoManagerDelegate?
 
    
     func fetchPhotoList()
    {
        let urlString = "\(photoListUrl)"
        print(urlString)
        performRequest(with: urlString)
    }
    
     func performRequest(with urlString : String)
     {
        if let url  = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                
                if error != nil {
                    //  self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data
                {
                    let photoData = self.parseJSON(safeData)
                    self.delegate?.getPhotoList(self, photoData: photoData)
                    
                }
                
            }
            
            task.resume()
        }
        
    }
    
    
     func parseJSON( _ photoData : Data) -> [PhotoData]
    {
        var photoarray = [PhotoData]()
        let decoder = JSONDecoder()
            do {
                let decodeData : [PhotoData] = try decoder.decode([PhotoData].self, from: photoData)
               photoarray = decodeData
            }
        catch {
            self.delegate?.didFailWithError(error: error)
            return []
            
        }

        return photoarray
    }
//
//    func ParseNextJSON( _ nextUrl : String) -> BookModel
//       {
//
//             var booksNext = BookModel(nextValue: nextUrl)
//             return booksNext
//       }
    
}

