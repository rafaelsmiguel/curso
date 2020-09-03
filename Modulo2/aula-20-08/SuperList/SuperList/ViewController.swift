//
//  ViewController.swift
//  SuperList
//
//  Created by Rafael Miguel on 20/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var products: [Product] = []
    var cleanProducts: [Product] = []
    var addViewController: AddViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let product1 = Product(name: "Picanha",price: "39,90",category: .food,selected: false)
        let product2 = Product(name: "Filé Mignon",price: "35,90",category: .food,selected: false)
        let product3 = Product(name: "Patinho",price: "32,90",category: .food,selected: false)
        let product4 = Product(name: "Peixinho",price: "29,90",category: .food,selected: false)
        let product5 = Product(name: "Acem",price: "22,90",category: .food,selected: false)

        let product6 = Product(name: "Bombril",price: "3,99",category: .clean,selected: false)
        let product7 = Product(name: "Pinho Sol",price: "10,90",category: .clean,selected: false)
        let product8 = Product(name: "Alvejante",price: "9,90",category: .clean,selected: false)
        let product9 = Product(name: "Detergente",price: "1,90",category: .clean,selected: false)
        let product10 = Product(name: "Sabão em Pó",price: "3,90",category: .clean,selected: false)
        let product11 = Product(name: "Contra filé",price: "28,90",category: .food,selected: false)

        products.append(product1)
        products.append(product2)
        products.append(product6)
        products.append(product7)
        products.append(product8)
        products.append(product3)
        products.append(product4)
        products.append(product5)
        products.append(product9)
        products.append(product10)
        products.append(product11)
        
//        let cleanProduct1 = Product(name: "Bombril",price: "3,99",category: .clean)
//        let cleanProduct2 = Product(name: "Pinho Sol",price: "10,90",category: .clean)
//        let cleanProduct3 = Product(name: "Alvejante",price: "9,90",category: .clean)
//        let cleanProduct4 = Product(name: "Detergente",price: "1,90",category: .clean)
//        let cleanProduct5 = Product(name: "Sabão em Pó",price: "3,90",category: .clean)
//
//        cleanProducts.append(cleanProduct1)
//        cleanProducts.append(cleanProduct2)
//        cleanProducts.append(cleanProduct3)
//        cleanProducts.append(cleanProduct4)
//        cleanProducts.append(cleanProduct5)
//
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
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
    func updateList(products: [Product]) {
        
//        for productItem in products {
//             self.products.append(productItem)
//        }
        
        self.products += products
        
        listTableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionName: String? = ""
        
        if section == 0 {
            sectionName = "Food"
        } else {
            sectionName = "Clean"
        }
        
        return sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return self.products.filter({$0.category == .food}).count
        } else {
            return self.products.filter({$0.category == .clean}).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = self.products.filter({$0.category == .food})[indexPath.row].name
            cell.detailTextLabel?.text = self.products.filter({$0.category == .food})[indexPath.row].price
        } else {
            cell.textLabel?.text = self.products.filter({$0.category == .clean})[indexPath.row].name
            cell.detailTextLabel?.text = self.products.filter({$0.category == .clean})[indexPath.row].price
        }
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell

        if self.products[indexPath.row].selected {
            self.products[indexPath.row].selected = false
            cell?.accessoryType = .none
            print(self.products[indexPath.row].name)
        } else {
            self.products[indexPath.row].selected = true
            cell?.accessoryType = .checkmark
            print(self.products[indexPath.row].name)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            switch indexPath.section {
            case 0:
                var array = self.products.filter({$0.category == .food})
                array.remove(at: indexPath.row)
                self.products = self.products.filter({$0.category != .food})
                self.products += array
            case 1:
                var array = self.products.filter({$0.category == .clean})
                array.remove(at: indexPath.row)
                self.products = self.products.filter({$0.category != .clean})
                self.products += array
                
            default: break
            }
            
//            self.products.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

