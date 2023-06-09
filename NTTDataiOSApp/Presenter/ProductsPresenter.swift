//
//  ProductsPresenter.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import Foundation

protocol ProductsViewUI {
    func updateUI()
}

final class ProductsPresenter {
    var products: [Product]
    
    var delegate: ProductsViewUI? = nil
    
    private let productsModel = ProductsModel()
    
    init(products: [Product] = []) {
        self.products = products
    }
    
    func getProducts() {
        productsModel.getProductsToService { productsResult in
            if productsResult.count > 0 {
                self.products = productsResult
                self.delegate?.updateUI()
            }
        }
    }
}
