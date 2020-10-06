//
//  ListaCarrosController.swift
//  MVC
//
//  Created by Rafael Miguel on 01/10/20.
//

import Foundation

class ListaCarrosController {
    
    var listCar: [Carro] = []
    
    func loadCars() {
        
        let carro1 = Carro(modelo: "Creta", ano: 2020, cor: "Branco")
        let carro2 = Carro(modelo: "HB20", ano: 2019, cor: "Prata")
        let carro3 = Carro(modelo: "Monza", ano: 2018, cor: "Preto")
        let carro4 = Carro(modelo: "Cruze", ano: 2017, cor: "Vermelho")
        let carro5 = Carro(modelo: "HRV", ano: 2016, cor: "Chumbo")
        
        self.listCar.append(carro1)
        self.listCar.append(carro2)
        self.listCar.append(carro3)
        self.listCar.append(carro4)
        self.listCar.append(carro5)
        
    }
    
    var listCarrosCount: Int {
        
        return self.listCar.count
        
    }
    
    
    func modeloCarro(indexPath: IndexPath) -> String {
        return listCar[indexPath.row].modelo ?? ""
    }
    
    func anoCarro(indexPath: IndexPath) -> String {
        return "\(listCar[indexPath.row].ano ?? 0)"
    }
    
    func corCarro(indexPath: IndexPath) -> String {
        return listCar[indexPath.row].cor ?? ""
    }
    
    func sorteio() -> String {
       
        let modelCar = listCar.randomElement()
        
        return "\(modelCar?.modelo ?? "") - \(modelCar?.cor ?? "") - \(modelCar?.ano ?? 0)"
    }
    
    
    
}
