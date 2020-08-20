//
//  ViewController.swift
//  List
//
//  Created by Rafael Miguel on 18/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let segueIdentifier: String = "productDetail"
    
    @IBOutlet weak var productTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    var arrayProduct: [String] = []
    var dictionary: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedAdd(_ sender: Any) {
        
        arrayProduct.append(productTextField.text ?? "")
        arrayProduct.append(priceTextField.text ?? "")
        
        dictionary = ["product": productTextField.text ?? "", "price": priceTextField.text ?? ""]
        
        //toda vez que rodar este metodo performSegue -> Sempre roda o prepare abaixo, porém é um override opcional
        self.performSegue(withIdentifier: self.segueIdentifier, sender: dictionary)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let product: [String]? = sender as? [String]
        
        let product: [String:String]? = sender as? [String:String]
        
        let vc: DetailViewController? = segue.destination as? DetailViewController
        
        
        vc?.productDict = product
        
        //self.present(vc ?? UIViewController(), animated: true, completion: nil)
    }
    
}

