//
//  CartaoViewModel.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 27/10/20.
//

import Foundation

class CartaoViewModel {
    
    let cartaoWorker: CartaoWorker = CartaoWorker()
    
    private var currentCartao: CartaoElement?
    
    var arrayCartoes: [CartaoElement] = []
    
    func getListCartao(completion: @escaping (Bool) -> Void) {
        
        self.cartaoWorker.getListCartao { (response, error) in
            if error == nil {
                self.arrayCartoes = response?.cartoes ?? [CartaoElement]()
                completion(true)
            } else {
                print("deu erro")
                completion(false)
            }
        }
    }
    
    var numberOfRows: Int {
        return self.arrayCartoes.count
    }
    
    var nome: String {
        return self.currentCartao?.nome ?? ""
    }
    
    var numero: String {
        return self.currentCartao?.numero ?? ""
    }
    
    func loadCurrentCartao(index:Int) {
        self.currentCartao = self.arrayCartoes[index]
    }
    
}
