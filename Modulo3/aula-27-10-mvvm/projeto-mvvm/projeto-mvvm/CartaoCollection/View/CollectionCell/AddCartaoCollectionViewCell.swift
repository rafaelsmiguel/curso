//
//  AddCartaoCollectionViewCell.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 10/11/20.
//

import UIKit


class AddCartaoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewButton: UIView!
    weak var delegate:CartaoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setupTapView()
    }
    
    func setupTapView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewButton.addGestureRecognizer(tap)
        viewButton.isUserInteractionEnabled = true
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.tappedAddButton()
    }
    
    

}
