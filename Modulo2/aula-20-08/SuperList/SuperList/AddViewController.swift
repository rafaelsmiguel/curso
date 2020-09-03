//
//  AddViewController.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

protocol AddViewContollerProtocol: class  {
    func updateList(products: [Product])
}

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var segmentedCategoria: UISegmentedControl!
    @IBOutlet weak var tableViewProducts: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    private var categorySelected: Category = .food
    
    
    weak var delegate: AddViewContollerProtocol?
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAdd.isEnabled = false
        tableViewProducts.isHidden = true
        saveButton.isEnabled = false
        
        textFieldName.delegate = self
        textFieldPrice.delegate = self
        tableViewProducts.delegate = self
        tableViewProducts.dataSource = self
        self.segmentedCategoria.selectedSegmentIndex = -1
        
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
        
        products.append(product)
        
        self.tableViewProducts.reloadData()
        
        clearFields()
        
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        
        if !products.isEmpty {
            self.delegate?.updateList(products: self.products)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
        
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
        
        self.textFieldName.resignFirstResponder()
        self.textFieldPrice.resignFirstResponder()
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

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !self.products.isEmpty {
            self.tableViewProducts.isHidden = false
            
            self.saveButton.isEnabled = true
            return self.products.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = products[indexPath.row].price
        
        return cell
    }
    
    
}
