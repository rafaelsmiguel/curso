//
//  ViewController.swift
//  MeuPrimeiroApp
//
//  Created by Rafael Miguel on 03/09/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listCarTableView: UITableView!
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listCarTableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "CarCell")
        
        self.listCarTableView.delegate = self
        self.listCarTableView.dataSource = self
        
        fillCarArray()
        
    }
    
    func fillCarArray() {
        
        let car1 = Car(model: "Creta", year: "2020", color: "White", km: 8000, selected: false)
        let car2 = Car(model: "Spin", year: "2021", color: "Grey", km: 8000, selected: false)
        let car3 = Car(model: "X1", year: "2017", color: "Black", km: 8000, selected: false)
        let car4 = Car(model: "Uno", year: "2014", color: "Red", km: 8000, selected: false)
        let car5 = Car(model: "Fusca", year: "1968", color: "Blue", km: 8000, selected: false)
        
        cars.append(car1)
        cars.append(car2)
        cars.append(car3)
        cars.append(car4)
        cars.append(car5)
     }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath)
//
//        cell.textLabel?.text = self.cars[indexPath.row].model
//        cell.detailTextLabel?.text = self.cars[indexPath.row].year
        
        let cell: CarCell? = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as? CarCell
        
        cell?.setupCell(car: cars[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: UITableViewCell? = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
        
        if self.cars[indexPath.row].selected {
            self.cars[indexPath.row].selected = false
            cell?.accessoryType = .none
        } else {
            self.cars[indexPath.row].selected = true
            cell?.accessoryType = .checkmark
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    
    
    
    
}

