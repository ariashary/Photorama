//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Muhammad Ashary on 18/08/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
    }
    
}
