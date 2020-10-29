//
//  ViewController.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 27/10/20.
//

import UIKit

class CartoesVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var viewModel: CartaoViewModel = CartaoViewModel()
    
    var controller: CartaoController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getListCartao { (success) in
            if success {
                self.myTableView.delegate = self
                self.myTableView.dataSource = self
            }
        }
        
        
//        self.controller = CartaoController()
        
//        self.controller?.getListCartao(completion: { (success) in
//
//            if success {
//                self.myTableView.delegate = self
//                self.myTableView.dataSource = self
//            }
//        })
    }
}

extension CartoesVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.viewModel.loadCurrentCartao(index: indexPath.row)
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.nome
        cell.detailTextLabel?.text = self.viewModel.numero
        
        return cell
    }
    
    
    
}
