//
//  File.swift
//  OrientacaoObjeto
//
//  Created by Rafael Miguel on 27/07/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import Foundation

class Animal {
    
    //porque utilizar o optional?
    //não precisa ter inicializador(init)
    //Quando não tem init, o inicializador da classe é o padrão var animal = Animal()
    
    
    var tamanho:String?
    var raca: String?
    var cor: String?
    var qtdPatas: Int?
    var genero: String?
    var especie: String?
    var idade: Int?
    
    init(tamanho:String, raca:String?, cor:String, qtdPatas:Int, genero:String, especie:String, idade:Int) {
        self.tamanho = tamanho
        self.raca = raca
        self.cor = cor
        self.qtdPatas = qtdPatas
        self.genero = genero
        self.especie = especie
        self.idade = idade
    }
}

struct Animal2 {
       var tamanho:String?
       var raca: String?
       var cor: String?
       var qtdPatas: Int?
       var genero: String?
       var especie: String?
       var idade: Int?
}
