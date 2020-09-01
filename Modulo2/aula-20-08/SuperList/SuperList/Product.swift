//
//  Product.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import Foundation

enum Category {
    case food
    case clean
}

struct Product {
    
    var name:String?
    var price: String?
    var category: Category
    var selected: Bool
    
    init(name: String, price: String, category: Category, selected: Bool) {
        self.name = name
        self.price = price
        self.category = category
        self.selected = selected
    }
    
}
