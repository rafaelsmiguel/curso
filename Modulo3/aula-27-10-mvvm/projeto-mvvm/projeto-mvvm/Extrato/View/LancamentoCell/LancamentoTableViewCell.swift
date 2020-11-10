//
//  LancamentoTableViewCell.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 03/11/20.
//

import UIKit

class LancamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgLancamento: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setup(lancamento: LancamentoElement) {
//
//        self.labelDescription.text = lancamento.nome
//        self.setupValor(lancamento: lancamento)
//        self.setupColorItens(tipo: lancamento.tipo)
//
//    }
        
    func setupValor(tipo: String, valor: Double) {
        
        if tipo == "S" {
            self.labelValue.text = "R$ -\(String(format: "%.2f", valor))"
        } else {
            self.labelValue.text = "R$ \(String(format: "%.2f", valor))"
            
        }
    }
    
    func setupColorItens(tipo: String) {
        if tipo == "E" {
            self.imgLancamento.tintColor = .green
            self.labelValue.textColor = .black
        } else {
            self.imgLancamento.tintColor = .red
            self.labelValue.textColor = .red
        }
    }
    
    
    func setup(value: ExtratoViewModel?) {
        
        if let _vm = value {
            
            self.labelDescription.text = _vm.nome
            self.setupValor(tipo: _vm.tipo, valor: _vm.valor)
            self.setupColorItens(tipo: _vm.tipo)
            
        }
    }
    
    func setup(value: FaturaViewModel?) {
        
        if let _vm = value {
            
            self.labelDescription.text = _vm.nome
            self.setupValor(tipo: _vm.tipo, valor: _vm.valor)
            self.setupColorItens(tipo: _vm.tipo)
            
        }
    }
}
