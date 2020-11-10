//
//  Fatura.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 05/11/20.
//

import Foundation

struct CardList: Codable {
    
    var cardList:[CardListElement]?
    
}

struct CardListElement: Codable {
    
    var cardID: String?
    var invoice: [Invoice]?
    
}

struct Invoice: Codable {
    var id: String
    var nome: String
    var data: String
    var valor: Double
    var tipo: String
}
