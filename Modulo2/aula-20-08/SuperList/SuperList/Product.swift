//
//  Product.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import Foundation

struct Product {
    
    var name:String?
    var price: String?
    
    init(name: String, price: String) {
        self.name = name
        self.price = price
    }
    
}
