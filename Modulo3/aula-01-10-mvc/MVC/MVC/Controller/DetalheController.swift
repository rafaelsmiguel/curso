//
//  DetalheController.swift
//  MVC
//
//  Created by Rafael Miguel on 06/10/20.
//

import Foundation

class DetalheController {
    
    private var carro: Carro?
    
    init(carro: Carro?) {
        self.carro = carro
    }
    
    func setupLabel() -> Carro{
        
        return carro ?? Carro()
    }
    
}
