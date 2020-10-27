//
//  CarrosModel.swift
//  mvc-json-carros
//
//  Created by Rafael Miguel on 20/10/20.
//

import Foundation

struct CarroModel: Codable {
    let carros: [CarroElement]
}

struct CarroElement: Codable {
    var id: String?
    var modelo: String?
    var ano: Int?
    var cor: String?
    var imagem: String?
}


