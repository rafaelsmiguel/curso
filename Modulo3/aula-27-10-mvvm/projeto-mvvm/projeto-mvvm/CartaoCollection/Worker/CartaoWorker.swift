//
//  CartaoWorker.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 27/10/20.
//

import Foundation

class CartaoWorker {
    
    func getListCartao(completion:(Cartao?,Bool?) -> Void) {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(Cartao.self, from: data)
                
                print(decodeObject)
                
                completion(decodeObject, nil)
                
            }catch {
                completion(nil,true)
            }
        }
        
    }
    
}
