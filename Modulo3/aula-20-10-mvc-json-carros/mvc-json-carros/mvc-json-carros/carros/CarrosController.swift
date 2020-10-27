//
//  CarrosController.swift
//  mvc-json-carros
//
//  Created by Rafael Miguel on 20/10/20.
//

import Foundation

class CarrosController {
    
    var response: CarroModel?
    var currentCarro: CarroElement?
    
//    var numberOfRows: Int {
//        return self.response.count
//    }
    
    var count: Int {
        return response?.carros.count ?? 0
    }
    
    func loadCurrentCarro(index: Int) {
        self.currentCarro = self.response?.carros[index]
    }
    
    var modeloCarro: String {
        return self.currentCarro?.modelo ?? ""
    }
    
    var anoCarro: Int {
        return self.currentCarro?.ano ?? 0
    }
    

    func getListCarros(completion: (Bool) -> Void) {
        
        CarroWorker().getListCarros { (success, error) in
            
            if error == false {
                self.response = success
                completion(true)
            } else {
                print("deu ruim na hora do parse do JSON")
            }
        }
    }
        
    
}
