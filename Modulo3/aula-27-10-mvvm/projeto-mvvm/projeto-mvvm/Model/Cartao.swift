//
//  Cartao.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 27/10/20.
//

import Foundation

struct Cartao: Codable {
    let cartoes: [CartaoElement]
}

struct CartaoElement: Codable {
    let id: String
    let nome: String
    let data: String
    let numero: String
    let bandeira: String
}
