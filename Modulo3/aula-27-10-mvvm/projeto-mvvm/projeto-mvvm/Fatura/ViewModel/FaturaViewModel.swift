//
//  FaturaViewModel.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 05/11/20.
//

import Foundation

class FaturaViewModel {
    
    private var cardID: String? = ""
    private var cardListElement: CardListElement?
    private var currentInvoice: Invoice?
    let faturaWorker: FaturaWorker = FaturaWorker()
    var cardList: [CardListElement] = []
    
    init(cardId: String?, cardListElement: CardListElement?, currentInvoice: Invoice? = nil) {
        self.cardID = cardId
        self.cardListElement = cardListElement
        self.currentInvoice = currentInvoice
    }
    
    var numberOfRows: Int {
        return self.cardListElement?.invoice?.count ?? 0
    }
    
    func loadCurrentInvoice(index:Int) {
        self.currentInvoice = self.cardListElement?.invoice?[index]
    }
    
    var id: String {
        return self.currentInvoice?.id ?? ""
    }
    
    var nome: String {
        return self.currentInvoice?.nome ?? ""
    }
    
    var data: String {
        return self.currentInvoice?.data ?? ""
    }
    
    var valor: Double {
        return self.currentInvoice?.valor ?? 0
    }
    
    var tipo: String {
        return self.currentInvoice?.tipo ?? ""
    }
    
    private var currentLancamento: LancamentoElement?
    
    func getFatura(completion: @escaping (Bool) -> Void) {

        self.faturaWorker.cardID = self.cardID ?? ""
        self.faturaWorker.getFatura { (response, error) in
            if error == nil {
                self.cardListElement = response
                completion(true)
            } else {
                print("deu erro")
                completion(false)
            }
        }
    }
}
