//
//  ViewController.swift
//  mvc-json-carros
//
//  Created by Rafael Miguel on 20/10/20.
//

import UIKit

class CarrosVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let carrosController = CarrosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getListCarros()
        
    }
    
    func getListCarros() {
        
        self.carrosController.getListCarros(completion: {(success) in
            
            if success {
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
        })
    }
}

extension CarrosVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carrosController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.carrosController.loadCurrentCarro(index: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.carrosController.modeloCarro
        cell.detailTextLabel?.text = "\(self.carrosController.anoCarro)"
        
        return cell
    }
    
    
    
}



