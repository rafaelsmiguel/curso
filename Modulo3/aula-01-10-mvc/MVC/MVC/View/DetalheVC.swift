//
//  DetalheVC.swift
//  MVC
//
//  Created by Rafael Miguel on 06/10/20.
//

import UIKit

class DetalheVC: UIViewController {
    
    @IBOutlet weak var resultadoSorteio: UILabel!
    
    var detalheController: DetalheController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let obj = detalheController?.setupLabel()
        
        resultadoSorteio.text = obj?.modelo
    }
}
