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
        
        controller.loadCars()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func tapSortear(_ sender: UIButton) {
        
//        self.detalheVC.resultado = self.controller.sorteio()
        
        //instaciei tela
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detalheViewController = storyBoard.instantiateViewController(withIdentifier: "DetalheVC") as! DetalheVC
        detalheViewController.detalheController = DetalheController(carro: self.controller.sorteio())
            
        self.present(detalheViewController, animated: true, completion: nil)
        
        
        
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

