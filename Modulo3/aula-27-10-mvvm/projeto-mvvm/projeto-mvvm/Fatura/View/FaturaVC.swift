//
//  FaturaVC.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 05/11/20.
//

import UIKit

class FaturaVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FaturaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.getFatura { (success) in
            if success {
                self.tableView.register(UINib(nibName: "LancamentoTableViewCell", bundle: nil), forCellReuseIdentifier: "LancamentoTableViewCell")
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.separatorStyle = .none
            }
        }
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}

extension FaturaVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LancamentoTableViewCell", for: indexPath) as! LancamentoTableViewCell
        
        self.viewModel?.loadCurrentInvoice(index: indexPath.row)
        cell.setup(value: viewModel)
        
        return cell
    }

}
