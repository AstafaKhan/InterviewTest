//
//  DIConfigurator.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import UIKit

final class DIConfigurator {

    private static let sharedOjbect = DIConfigurator()

    class func sharedInst() -> DIConfigurator {
        return sharedOjbect
    }

    //    MARK:- Register TableView Header Xib
    func registerHeaderView(Nib:NibBoard, tableview:UITableView) {
        tableview.register(UINib(nibName: Nib.rawValue, bundle: nil),forHeaderFooterViewReuseIdentifier: Nib.rawValue)
    }
    //    MARK:- Register TableView Cell
    func registerTableCellwithNib(Nib: NibBoard, tableview:UITableView)  {
        tableview.register(UINib(nibName: Nib.rawValue, bundle: nil), forCellReuseIdentifier: Nib.rawValue)
        tableview.tableFooterView = UIView()
    }
    //    MARK:- Register Collection Cell Xib
    func registerCollectionCellNib(Nib:NibBoard,collectionView:UICollectionView) {
        collectionView.register(UINib(nibName: Nib.rawValue, bundle: nil), forCellWithReuseIdentifier: Nib.rawValue)
    }
    
}

