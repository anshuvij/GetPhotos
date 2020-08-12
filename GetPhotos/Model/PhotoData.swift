//
//  PhotoData.swift
//  GetPhotos
//
//  Created by Mobile Apps Team on 8/11/20.
//  Copyright © 2020 anshu vij. All rights reserved.
//

import Foundation

struct PhotoData : Decodable
{
    let format : String
    let width : Int
    let height : Int
    let filename : String
    let id : Int
    let author : String
    let author_url: String
    let post_url: String
}
