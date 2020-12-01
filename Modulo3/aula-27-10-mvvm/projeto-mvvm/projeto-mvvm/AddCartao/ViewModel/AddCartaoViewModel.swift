//
//  AddCartaoViewModel.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 17/11/20.
//

import Foundation


class AddCartaoViewModel {
    
    var cartao:CartaoElement?
    
    init(nome: String, numero: String, data: String) {
        
        cartao = CartaoElement(id: "", nome: nome, data: data, numero: numero, bandeira: "")
       
    }
    
    func setNome(nome:String) {
        self.cartao?.nome = nome
    }
    
    func setNumeroCartao(numero:String) {
        self.cartao?.numero = numero
    }
    
    func setData(data:String) {
        self.cartao?.data = data
    }
    
    func setBandeira(bandeira:String) {
        self.cartao?.bandeira = bandeira
    }
    
    var nome: String {
        return cartao?.nome ?? ""
    }
    
    var numero: String {
        return cartao?.numero ?? ""
    }
    
    var data: String {
        return cartao?.data ?? ""
    }
    
    var bandeira: String {
        return cartao?.bandeira ?? ""
    }
    
}
