//
//  CollectionHeaderView.swift
//  DIY
//
//  Created by Khrystyna Shevchuk on 6/29/17.
//  Copyright © 2017 Khrystyna Shevchuk. All rights reserved.
//

import UIKit


class CollectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var backgroundImageView: UIView!
    @IBOutlet weak var backgroundImageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    private var backgroundImageViewHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundImageViewHeight = backgroundImageView.bounds.height
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let attributes = layoutAttributes as! DIYLayoutAttributes
        backgroundImageViewHeightLayoutConstraint.constant = backgroundImageViewHeight - attributes.deltaY 
    }
}
