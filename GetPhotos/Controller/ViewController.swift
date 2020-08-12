//
//  ViewController.swift
//  GetPhotos
//
//  Created by Mobile Apps Team on 8/11/20.
//  Copyright © 2020 anshu vij. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoManager = PhotoManager()
    var photoData = [PhotoData]()
    
    var imageURL = "https://picsum.photos/300/300?image"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading thre view.
        self.navigationItem.title = "Loren Picsum"
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        photoManager.delegate = self
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         photoManager.fetchPhotoList()
    }


}

extension ViewController : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        let photoValues = photoData[indexPath.row]
         cell.authorName.text = photoValues.author
        
        let photoId = String(photoValues.id)
        let urlS = "\(imageURL)=\(photoId)"
        

        cell.imageView.loadImagesUsingUrl(urlString: urlS)
    
       
        return cell

        
    }
    
    
}


extension ViewController : UICollectionViewDelegate
{
    
}

extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 50 / 2
        return CGSize(width: width, height: width)
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension ViewController : PhotoManagerDelegate {
    func getPhotoList(_ photoManager: PhotoManager, photoData: [PhotoData]) {
       
         self.photoData = photoData
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    
}


