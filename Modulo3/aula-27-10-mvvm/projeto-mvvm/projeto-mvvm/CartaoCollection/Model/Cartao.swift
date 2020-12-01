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
    var id: String
    var nome: String
    var data: String
    var numero: String
    var bandeira: String
}

enum Flag: String {
    case mastercard = "mastercard"
    case visa = "visa"
    case elo = "elo"
    case none = "outros"
  
static func loadFlag(index: Int) -> Flag {
    switch index {
    case 0:
      return .visa
    case 1:
      return .mastercard
    case 2:
      return .elo
    default:break
    }
    return .none
  }
}
