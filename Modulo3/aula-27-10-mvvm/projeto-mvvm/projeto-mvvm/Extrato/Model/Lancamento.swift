//
//  Lancamentos.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 03/11/20.
//

import Foundation

struct Lancamento: Codable {
    var lancamentos:[LancamentoElement]
}

struct LancamentoElement: Codable {
    
    var id: String
    var nome: String
    var data: String
    var valor: Double
    var tipo: String
}
