//
//  ViewController.swift
//  DIY
//
//  Created by Khrystyna Shevchuk on 6/29/17.
//  Copyright © 2017 Khrystyna Shevchuk. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return UIStatusBarStyle.lightContent
        }
    }
    
    //MARK: vc lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let width = collectionView?.bounds.width else { return }
        let layout = collectionViewLayout as! DIYLayout
        layout.headerReferenceSize = CGSize(width: width, height: 180)
        layout.itemSize = CGSize(width: width, height: 62)
    }
}


//MARK: UICollectionViewDataSource

extension ViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath)
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = "cell number \(indexPath.item)"
        return cell
    }
}

