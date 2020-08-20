//
//  DetailViewController.swift
//  List
//
//  Created by Rafael Miguel on 18/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: [String]?
    var productDict: [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productLabel.text = productDict?["product"]
        self.priceLabel.text = productDict?["price"]
        
//        self.productLabel.text = product?[0]
//        self.priceLabel.text = product?[1]
        
        print("DetailViewController-viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DetailViewController-viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DetailViewController-viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("DetailViewController-viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("DetailViewController-viewWillDisappear")
    }
    
    
    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
