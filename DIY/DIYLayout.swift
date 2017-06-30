//
//  DIYLayout.swift
//  DIY
//
//  Created by Khrystyna Shevchuk on 6/29/17.
//  Copyright © 2017 Khrystyna Shevchuk. All rights reserved.
//

import UIKit


class DIYLayoutAttributes : UICollectionViewLayoutAttributes {
    
    var deltaY: CGFloat = 0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! DIYLayoutAttributes
        copy.deltaY = deltaY
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? DIYLayoutAttributes {
            if attributes.deltaY == deltaY {
                return super.isEqual(object)
            }
        }
        return false
    }
}

class DIYLayout: UICollectionViewFlowLayout {
        
    override class var layoutAttributesClass: AnyClass {
        return DIYLayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect) as! [DIYLayoutAttributes]
        
        let offset = collectionView!.contentOffset
        if offset.y < 0 {
            let deltaY = fabs(offset.y)
            for atributes in layoutAttributes {
                if let elementKind = atributes.representedElementKind {
                    if elementKind == UICollectionElementKindSectionHeader {
                        var frame = atributes.frame
                        frame.size.height = max(0, headerReferenceSize.height + deltaY)
                        frame.origin.y = frame.minY - deltaY
                        atributes.frame = frame
                        atributes.deltaY = deltaY
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
