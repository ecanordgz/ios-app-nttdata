//
//  ProductsModel.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import Foundation

final class ProductsModel {
    var products: [Product]
    
    init(products: [Product] = []) {
        self.products = products
    }
    
    func getProductsToService(completionBlock:@escaping ([Product]) -> Void) {
        let urlString = "https://dummyjson.com/products"
        let urlSession = URLSession.shared
        
        guard let url = URL(string: urlString) else {
            completionBlock(self.products)
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            guard let responseData = data else {
                completionBlock(self.products)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let jsonDecoded = try? jsonDecoder.decode(Products.self, from: responseData) {
                if let productsResult = jsonDecoded.products {
                    if productsResult.count > 0 {
                        self.products = productsResult
                        completionBlock(self.products)
                    }
                }
            }
        }.resume()
    }
}
