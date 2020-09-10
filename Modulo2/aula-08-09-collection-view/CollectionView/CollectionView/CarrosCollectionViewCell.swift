//
//  CarrosCollectionViewCell.swift
//  CollectionView
//
//  Created by Rafael Miguel on 08/09/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class CarrosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var carroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(carro:Carro) {
        
        modeloLabel.text = carro.modelo
        anoLabel.text = carro.ano
        carroImageView.image = UIImage(named: carro.imagem ?? "")
    }

}
