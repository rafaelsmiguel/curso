//
//  ExtratoViewModel.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 03/11/20.
//

import Foundation

class ExtratoViewModel {
    
    let extratoWorker: ExtratoWorker = ExtratoWorker()
    
    private var currentLancamento: LancamentoElement?
    
    var arrayLancamento: [LancamentoElement] = []
    
    func getListLancamento(completion: @escaping (Bool) -> Void) {

        self.extratoWorker.getListLancamento { (response, error) in
            if error == nil {
                self.arrayLancamento = response?.lancamentos ?? [LancamentoElement]()
                completion(true)
            } else {
                print("deu erro")
                completion(false)
            }
        }
    }
    
    var numberOfRows: Int {
        return self.arrayLancamento.count
    }
    
    var id: String {
        return self.currentLancamento?.id ?? ""
    }
    
    var nome: String {
        return self.currentLancamento?.nome ?? ""
    }
    
    var data: String {
        return self.currentLancamento?.data ?? ""
    }
    
    var valor: Double {
        return self.currentLancamento?.valor ?? 0
    }
    
    var tipo: String {
        return self.currentLancamento?.tipo ?? ""
    }
    
    func loadCurrentLancamento(index:Int) {
        self.currentLancamento = self.arrayLancamento[index]
    }
    
}
