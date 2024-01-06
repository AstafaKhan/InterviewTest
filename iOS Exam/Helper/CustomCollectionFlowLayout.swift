//
//  CustomCollectionFlowLayout.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import UIKit

class CustomCollectionFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        scrollDirection = .horizontal
        itemSize = CGSize(width: (self.collectionView?.frame.width ?? 0) - 80, height: (self.collectionView?.frame.height ?? 0) - 30)
        
        let peekingItemWidth = itemSize.width / 25
        let horizontalInsets = (collectionView.frame.size.width - itemSize.width) / 2
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalInsets, bottom: 0, right: horizontalInsets)
        minimumLineSpacing = horizontalInsets - peekingItemWidth
    }
    
}

extension UICollectionViewCell{
    static var reuseIdentifier: String {String(describing: self) }
    func transformToLarge() {
        UIView.animate(withDuration: 0.3) {
           self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.3) {
            self.transform = CGAffineTransform.identity
        }
    }
    

}
