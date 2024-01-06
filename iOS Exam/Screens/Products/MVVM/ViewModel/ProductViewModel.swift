//
//  ProductViewModel.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import Foundation

final class ProductViewModel {

    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure

    func fetchProducts(categoryName:String) {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [Product].self,type: ProductEndPoint.productsbasedOnCategory(categoryName: categoryName)) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.products = products + products + products /*(Doing Duplicay for Increase the ProductList for Scrolling the list)*/
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
}

extension ProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }

}
