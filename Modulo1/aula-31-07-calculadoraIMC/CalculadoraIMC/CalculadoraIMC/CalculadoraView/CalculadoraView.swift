//
//  CalculadoraView.swift
//  CalculadoraIMC
//
//  Created by Rafael Miguel on 31/07/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

protocol CalculadoraViewProtocol: class { //class -> boas praticas para não ter retaincycle
    
    func successCalcIMC(value: String)

    func failureCalcIMC(value: String)
}


class CalculadoraView: UIView {
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    
    weak var delegate: CalculadoraViewProtocol?
    
    func setupView(color: UIColor) {
        self.alturaTextField.placeholder = "Altura"
        self.pesoTextField.placeholder = "Peso"
        self.backgroundColor = color
    }
    
    func calcularIMC() {
        
        let height: Float = Float(self.alturaTextField.text ?? "" ) ?? 0
        let weight: Float = Float(self.pesoTextField.text ?? "" ) ?? 0

        let height2 = height * height
        
        let imc = weight/height2
        
        var result: String = ""
        
        if height <= 0 || weight <= 0 {
            self.delegate?.failureCalcIMC(value: "Não conseguimos calcular")
        } else {
            if imc < 16 {
                result = "Abaixo do peso"
            } else if imc >= 19 && imc < 25 {
                result = "Peso normal"
            } else if imc >= 25 && imc < 30 {
                result = "Sobrepeso"
            } else if imc >= 30 && imc < 40 {
                result = "Obesidade Grau 1"
            } else if imc > 40 {
                result = "Obesidade Grau 2"
            }
            
            self.delegate?.successCalcIMC(value: result)
        }
    }
}
