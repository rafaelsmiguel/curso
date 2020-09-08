//
//  CarCell.swift
//  MeuPrimeiroApp
//
//  Created by Rafael Miguel on 03/09/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {

    
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelColor: UILabel!
    @IBOutlet weak var labelKm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(car:Car) {
        
        self.labelModel.text = car.model
        self.labelYear.text = car.year
        self.labelColor.text = car.color
        self.labelKm.text = "\(car.km ?? 0)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
