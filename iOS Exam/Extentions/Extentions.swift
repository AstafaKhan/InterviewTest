//
//  Extentions.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 05/01/2024.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }

}
