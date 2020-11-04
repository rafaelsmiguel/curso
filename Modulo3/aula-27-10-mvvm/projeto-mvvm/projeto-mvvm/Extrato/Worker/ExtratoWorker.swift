//
//  ExtratoWorker.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 03/11/20.
//

import Foundation

class ExtratoWorker {
    
    func getListLancamento(completion:(Lancamento?,Bool?) -> Void) {
        
        if let path = Bundle.main.path(forResource: "despesas", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(Lancamento.self, from: data)
                
                print(decodeObject)
                
                completion(decodeObject, nil)
                
            }catch {
                completion(nil,true)
            }
        }
        
    }
    
}
