//
//  CartaoCollectionViewCell.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 29/10/20.
//

import UIKit

class CartaoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imgBrand: UIImageView!
    
    static let identifier = "CartaoCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CartaoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(cartao:CartaoElement) {
        
        self.labelName.text  = cartao.nome
        self.labelNumber.text = cartao.numero
        self.labelDate.text = cartao.data
        
        configureBrand(cartao: cartao)

    }
    
    func configureBrand(cartao:CartaoElement) {
        
        if cartao.bandeira == "visa" {
            self.imgCard.image = UIImage(named: "fundo-visa.jpg")
            self.imgBrand.image = UIImage(named: "visa.png")
        } else {
            self.imgCard.image = UIImage(named: "fundo-master.jpg")
            self.imgBrand.image = UIImage(named: "mastercard.png")
        }
        
    }
    
}
