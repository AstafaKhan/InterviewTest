//
//  Product.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import Foundation


struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Codable {
    let rate: Double
    let count: Int
}
