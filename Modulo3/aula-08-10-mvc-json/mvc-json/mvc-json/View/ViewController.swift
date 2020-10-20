//
//  ViewController.swift
//  mvc-json
//
//  Created by Rafael Miguel on 08/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let contatosController = ContatosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getListContatos()
        
    }
    
    func getListContatos() {
        
        contatosController.getListContatos { (success, error) in
            
            if success {
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contatosController.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.contatosController.loadCurrentContato(indexPath: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.contatosController.nomeContato
        cell.detailTextLabel?.text = self.contatosController.telefoneContato
        
        return cell
        
    }
    
    
}

