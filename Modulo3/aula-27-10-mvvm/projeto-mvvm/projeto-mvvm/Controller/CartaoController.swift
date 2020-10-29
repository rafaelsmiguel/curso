//
//  CarroController.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 27/10/20.
//

import Foundation

class CartaoController {
    
    private var cartao: Cartao?
    
    var currentCartao: CartaoElement?
    
    var nome: String {
        return self.currentCartao?.nome ?? ""
    }
    
    var numero: String {
        return self.currentCartao?.numero ?? ""
    }
    
    func loadCurrentCartao(index:Int) {
        self.currentCartao = self.cartao?.cartoes[index]
    }
    
    var count: Int {
        return cartao?.cartoes.count ?? 0
    }
    
//    func getListCartao(completion:(Bool) -> Void) {
//        
//        CartaoWorker().getListCartao { (cartao, error) in
//            if error == false {
//                self.cartao = cartao
//                completion(true)
//            } else {
//                completion(false)
//                print("Deu ruim na hora do parse do JSON")
//            }
//        }
//        
//    }
    
   
}
