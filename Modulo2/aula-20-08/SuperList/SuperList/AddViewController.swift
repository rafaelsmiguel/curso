//
//  AddViewController.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

protocol AddViewContollerProtocol: class  {
    func updateList(product: Product)
}

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var segmentedCategoria: UISegmentedControl!
    
    private var categorySelected: Category = .food
    
    
    weak var delegate: AddViewContollerProtocol?
    
    //var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAdd.isEnabled = false
        textFieldName.delegate = self
        textFieldPrice.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        
        guard let name = self.textFieldName.text else {
            print("Digite um nome")
            return
        }
        
        guard let price = self.textFieldPrice.text else {
            print("Digite um preço")
            return
        }
            
        let product = Product(name: name, price: price, category: categorySelected, selected: false)
        
        self.delegate?.updateList(product: product)
        
        clearFields()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func clearFields() {
        self.textFieldName.text = ""
        self.textFieldPrice.text = ""
        self.btnAdd.isEnabled = false
        
        self.textFieldName.becomeFirstResponder()
    }
    
    @IBAction func tappedCategory(_ sender: UISegmentedControl) {
        
            if segmentedCategoria.selectedSegmentIndex == 0 {
            categorySelected = .food
        } else {
            categorySelected = .clean
        }
    }
    
    
}

extension AddViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (self.textFieldName.text?.isEmpty ?? false) || (self.textFieldPrice.text?.isEmpty ?? false) {
            self.btnAdd.isEnabled = false
        } else {
            self.btnAdd.isEnabled = true
        }
    }
    
    
}
