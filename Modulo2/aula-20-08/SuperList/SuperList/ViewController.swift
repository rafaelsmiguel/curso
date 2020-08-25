//
//  ViewController.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var products: [Product] = []
    var addViewController: AddViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(products)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(products)
    }
    
    @IBAction func clickAddButtomn(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: AddViewController? = segue.destination as? AddViewController
        
        vc?.delegate = self
    }
    
}

extension ViewController: AddViewContollerProtocol {
    func updateList(product: Product) {
        self.products.append(product)
    }
    
    
}

