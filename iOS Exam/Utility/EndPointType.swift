//
//  EndPointType.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import Foundation


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
