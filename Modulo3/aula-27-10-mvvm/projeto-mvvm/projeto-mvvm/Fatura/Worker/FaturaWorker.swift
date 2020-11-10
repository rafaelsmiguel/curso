//
//  FaturaWorker.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 05/11/20.
//

import Foundation

class FaturaWorker {
    
    var cardID: String = ""
    
    func getFatura(completion:(CardListElement?,Bool?) -> Void) {
        
        if let path = Bundle.main.path(forResource: "invoice", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(CardList.self, from: data)
                
                print(decodeObject)
                
                let list = decodeObject.cardList?.filter({$0.cardID == self.cardID})
                
                completion(list?.first, nil)
                
            }catch {
                completion(nil,true)
            }
        }
        
    }
    
}
