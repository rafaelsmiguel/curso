//
//  CarroWorker.swift
//  mvc-json-carros
//
//  Created by Rafael Miguel on 20/10/20.
//

import Foundation

//typealias completion <T> = (_ result: T, _ failure:Bool) -> Void

class CarroWorker {
    
    func getListCarros(completion: (CarroModel?, Bool) -> Void) {
        
        if let path = Bundle.main.path(forResource: "carros", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeObject = try JSONDecoder().decode(CarroModel.self, from: data)
                
                print(decodeObject)
                
                completion(decodeObject, false)
                
            }catch {
                completion(nil,true)
            }
            
        }
        
    }
    
}
