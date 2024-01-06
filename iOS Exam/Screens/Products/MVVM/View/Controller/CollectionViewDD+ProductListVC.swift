//
//  CollectionViewDD+ProductListVC.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import UIKit

//MARK: - Collcetion Datasource and delegate for Top images carousel
extension ProductListVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.CategoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.className, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
        cell.UpdateDatainUI(categoryName: self.CategoryList[indexPath.item])
        indexPath.row == self.currentCardIndex ? cell.transformToLarge() : cell.transformToStandard()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = self.CategoryCV.collectionViewLayout as? CustomCollectionFlowLayout else{return CGSize(width: 0.0, height: 0.0)}
        return flowLayout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        switch scrollView {
        case self.CategoryCV:
            self.walletCurrentPage = Int(scrollView.contentOffset.x / width)
        default:
            return
        }
    }
}

//MARK: - ScrollView
extension ProductListVC{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        switch scrollView {
        case self.CategoryCV:
            let currentCell = self.CategoryCV.cellForItem(at: IndexPath(row: Int(self.currentCardIndex), section: 0))
            currentCell?.transformToStandard()
        default:
            return
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard scrollView == self.CategoryCV else {
            return
        }
        targetContentOffset.pointee = scrollView.contentOffset
        let flowLayout = self.CategoryCV.collectionViewLayout as! CustomCollectionFlowLayout
        let cellWidthIncludingSpacing = flowLayout.itemSize.width + flowLayout.minimumLineSpacing
        let offset = targetContentOffset.pointee
        let horizontalVelocity = velocity.x
        var selectedIndex = self.currentCardIndex
        switch horizontalVelocity {
            // On swiping
        case _ where horizontalVelocity > 0 :
            selectedIndex = self.currentCardIndex + 1
        case _ where horizontalVelocity < 0:
            selectedIndex = self.currentCardIndex - 1
            // On dragging
        case _ where horizontalVelocity == 0:
            selectedIndex = Int(round((offset.x + scrollView.contentInset.left ) / cellWidthIncludingSpacing))
        default:
            break
        }
        let safeIndex = max(0, min(selectedIndex, self.CategoryList.count - 1))
        let selectedIndexPath = IndexPath(row: safeIndex, section: 0)
        flowLayout.collectionView!.scrollToItem(at: selectedIndexPath, at: .centeredHorizontally, animated: true)
        let previousSelectedIndex = IndexPath(row: Int(self.currentCardIndex), section: 0)
        let previousSelectedCell = self.CategoryCV.cellForItem(at: previousSelectedIndex)
        let nextSelectedCell = self.CategoryCV.cellForItem(at: selectedIndexPath)
        self.currentCardIndex = selectedIndexPath.row
        previousSelectedCell?.transformToStandard()
        nextSelectedCell?.transformToLarge()
        if(self.currentCardIndex != selectedIndexPath.row){
            self.currentCardIndex = selectedIndexPath.row
        }
    }
}
