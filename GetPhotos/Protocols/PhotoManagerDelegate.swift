//
//  PhotoManagerDelegate.swift
//  GetPhotos
//
//  Created by Mobile Apps Team on 8/11/20.
//  Copyright © 2020 anshu vij. All rights reserved.
//

import Foundation
protocol PhotoManagerDelegate {
    func getPhotoList(_ photoManager : PhotoManager, photoData : [PhotoData])
    func didFailWithError(error : Error)
}
