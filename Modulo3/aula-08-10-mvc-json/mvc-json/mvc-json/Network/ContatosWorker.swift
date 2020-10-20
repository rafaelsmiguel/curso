//
//  ContatosWorker.swift
//  mvc-json
//
//  Created by Rafael Miguel on 08/10/20.
//

import Foundation

typealias completion <T> = (_ result: T, _ failure:Bool) -> Void

class ContatosWorker {
    
    // tipo que cria pra atender em alguma situação especifica do que você precisar
    
    func getListContatos(completion: @escaping  completion<[Contato?]>) {
        
        if let path = Bundle.main.path(forResource: "contatos", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonCarregado = jsonResult as? [Dictionary<String, AnyObject>] {
                    
                    print("Deu bom")
                    print(jsonCarregado)
                    var contatos: [Contato] = []
                    
                    for item in jsonCarregado {
                        let contato = Contato(nome: item["nome"] as? String, telefone: item["telefone"] as! String)
                        
                        contatos.append(contato)
                    }
                    
                    
                    completion(contatos,false)
                }
                
            } catch {
                print("Deu ruim")
                completion([],true)
            }
            //return é sincrono
        }
        
    }
    
}
