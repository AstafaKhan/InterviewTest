//
//  Constants.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import Foundation

enum NibBoard:String {
    
//    MARK: -Collection Cell
    case CategoryCVC
    
    
//    MARK: - TableView Cell
    case ProductTVC
    
//    MARK: - SectionHeaderFooter TVC
    case SearchBarTVH
    
    
    var NibboardType: String {
        return rawValue
    }
}
