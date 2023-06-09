//
//  Product.swift
//  NTTDataiOSApp
//
//  Created by Enrique Cano on 08/06/23.
//

import Foundation

struct Product: Codable {
    var id: Int? = nil
    var title: String? = nil
    var description: String? = nil
    var price: Double? = nil
    var stock: Int? = nil
    var brand: String? = nil
    var category: String? = nil
    var thumbnail: String? = nil
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.stock = try container.decodeIfPresent(Int.self, forKey: .stock)
        self.brand = try container.decodeIfPresent(String.self, forKey: .brand)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
    }
}
