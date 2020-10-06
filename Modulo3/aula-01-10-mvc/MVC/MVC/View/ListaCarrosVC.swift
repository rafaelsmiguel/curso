//
//  ViewController.swift
//  MVC
//
//  Created by Rafael Miguel on 01/10/20.
//

import UIKit

class ListaCarrosVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clicouSortear: UIButton!
    @IBOutlet weak var resultadoSorteio: UILabel!
    
    let controller: ListaCarrosController = ListaCarrosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func tapSortear(_ sender: UIButton) {
        
        resultadoSorteio.text = self.controller.sorteio()
        
    }
}

extension ListaCarrosVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.listCarrosCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCar", for: indexPath)
        
        cell.textLabel?.text = self.controller.modeloCarro(indexPath: indexPath)
        cell.detailTextLabel?.text = self.controller.anoCarro(indexPath: indexPath)
        
        return cell
    }
}

