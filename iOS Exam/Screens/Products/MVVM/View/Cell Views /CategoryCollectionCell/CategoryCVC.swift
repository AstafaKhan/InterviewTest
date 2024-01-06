//
//  CategoryCVC.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import UIKit

class CategoryCVC: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.clipsToBounds = true
        categoryImageView.layer.cornerRadius = 25


        // Initialization code
    }

    func UpdateDatainUI(categoryName:String) {
        self.categoryImageView?.image = UIImage(named: categoryName)
        self.categoryNameLbl?.text = categoryName.uppercased()
    }
}
