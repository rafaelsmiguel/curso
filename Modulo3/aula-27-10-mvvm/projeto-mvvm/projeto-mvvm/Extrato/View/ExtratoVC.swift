//
//  ExtratoVC.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 03/11/20.
//

import UIKit

class ExtratoVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ExtratoViewModel = ExtratoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getListLancamento { (success) in
            if success {
                self.tableView.register(UINib(nibName: "LancamentoTableViewCell", bundle: nil), forCellReuseIdentifier: "LancamentoTableViewCell")
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.separatorStyle = .none
            }
        }
    }
}

extension ExtratoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.viewModel.loadCurrentLancamento(index: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LancamentoTableViewCell", for: indexPath) as! LancamentoTableViewCell
        
        cell.setup(value: viewModel)
        
        return cell
    }

}
