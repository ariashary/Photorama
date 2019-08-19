//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Muhammad Ashary on 18/08/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fetchInterestingPhotos {
            (PhotoResult) -> Void in
            
            switch PhotoResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
}
