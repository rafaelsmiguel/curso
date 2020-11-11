//
//  CartaoTableViewCell.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 29/10/20.
//

import UIKit

protocol CartaoTableViewCellDelegate: class {
    func tappedCreditCard(id: String?)
    func tappedAddButton()
}

class CartaoTableViewCell: UITableViewCell {

    static let identifier = "CartaoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CartaoTableViewCell", bundle: nil)
    }
    
    func setupList(cartoes: [CartaoElement]) {
        self.cartoes = cartoes
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var cartoes = [CartaoElement]()
    
    weak var delegate:CartaoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(CartaoCollectionViewCell.nib(), forCellWithReuseIdentifier:  CartaoCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: "AddCartaoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddCartaoCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CartaoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cartaoElement: CartaoElement
        
        cartaoElement = cartoes[indexPath.row]
        
        if cartaoElement.id == "" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCartaoCollectionViewCell", for: indexPath) as! AddCartaoCollectionViewCell
            
            cell.delegate = self.delegate
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartaoCollectionViewCell.identifier, for: indexPath) as! CartaoCollectionViewCell
            
            cell.setupCell(cartao: cartoes[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        self.delegate?.tappedCreditCard(id: self.cartoes[indexPath.item].id)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 320, height: 220)
//    }
    
    
}

