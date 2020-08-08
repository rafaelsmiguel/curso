//
//  CalculadoraVC.swift
//  CalculadoraIMC
//
//  Created by Rafael Miguel on 31/07/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class CalculadoraVC: BaseViewController {
   

    //protocolo -> 
    
    
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var calcView: CalculadoraView!
    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var calcButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.calcView.setupView()
//        self.setupView()
    }

    @IBAction func clicouCalcularButton(_ sender: UIButton) {
    
        
        self.calcView.calcularIMC()
//        self.resultadoLabel.text = self.calcView.calcularIMC()
    
    }
    
    override func setupView() {
        self.calcView.setupView(color: .yellow)
        self.calcView.delegate = self
        self.view.backgroundColor = .green
        self.viewPrincipal.backgroundColor = .green
        self.calcButton.backgroundColor = .green
        self.calcButton.setTitleColor(.black, for: .normal)

    }
    
   
}

extension CalculadoraVC: CalculadoraViewProtocol {
    
    func failureCalcIMC(value: String) {
        self.resultadoLabel.text = value
    }
    
    func successCalcIMC(value: String) {
        self.resultadoLabel.text = value
    }
    
   
    
}

