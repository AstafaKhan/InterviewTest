//
//  ProductTVC.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import UIKit

class ProductTVC: UITableViewCell {

    @IBOutlet weak var productImageView:UIImageView!
    @IBOutlet weak var productName:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func UpdateDatainCell(product:Product) {
        // Example usage:
        if let imageUrl = URL(string: product.image) {
            let imageLoader = ImageLoader()
            imageLoader.downloadImage(url: imageUrl) { image in
                if let image = image {
                    DispatchQueue.main.async {
                        self.productImageView.image = image
                    }
                    // Use the downloaded and cached image
                    // e.g., set the image to a UIImageView
                    
                    
                } else {
                    // Handle error or display a placeholder image
                }
            }
        }

//        self.productImageView.image = UIImage(ur)
        self.productName?.text = product.title
    }
    
    
}
