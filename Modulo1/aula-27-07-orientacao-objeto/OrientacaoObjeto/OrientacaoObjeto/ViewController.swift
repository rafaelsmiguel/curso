//
//  ViewController.swift
//  OrientacaoObjeto
//
//  Created by Rafael Miguel on 27/07/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var animal: Animal = Animal(tamanho: "Grande", raca: "Golden", cor: "Branco", qtdPatas: 4, genero: "Macho", especie: "Cachorro", idade: 20)
        
        print(animal.raca)
        
        var animal2: Animal2 = Animal2(tamanho: "Pequeno", raca: "Poodle", cor: "Branco", qtdPatas: 4, genero: "Femea", especie: "Cachorro", idade: 1)
        
        print(animal2)
        
    }


}

