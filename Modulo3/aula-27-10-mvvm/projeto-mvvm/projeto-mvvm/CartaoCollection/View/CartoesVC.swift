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
    
//    var controller: CartaoController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getListCartao { (success) in
            if success {
                self.myTableView.register(CartaoTableViewCell.nib(), forCellReuseIdentifier: CartaoTableViewCell.identifier)
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
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.viewModel.loadCurrentCartao(index: indexPath.row)
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: CartaoTableViewCell.identifier, for: indexPath) as! CartaoTableViewCell
        cell.delegate = self
        cell.setupList(cartoes: viewModel.arrayCartoes)
        
        return cell
    }
}

extension CartoesVC: CartaoTableViewCellDelegate {
    func tappedCreditCard(id: String?) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let faturaViewController = storyboard.instantiateViewController(withIdentifier: "FaturaVC") as! FaturaVC
        faturaViewController.viewModel = FaturaViewModel(cardId: id, cardListElement: nil, currentInvoice: nil)
        
//            detailViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(faturaViewController, animated: true)
        
        
       // self.performSegue(withIdentifier: "FaturaVC", sender: id)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc: FaturaVC = segue.destination as? FaturaVC
//        vc.viewModel = FaturaViewModel(cardId: sender as? String, cardListElement: nil, currentInvoice: nil)
//    }
    
}
