//
//  Custom.swift
//  SuperHotel
//
//  Created by Rafael Miguel on 05/10/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class TextFieldRed: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0);
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
        setupControl();
    }
    
    func setupControl()
    {
        super.backgroundColor = .white
        
        
        super.layer.cornerRadius = 5
        super.layer.borderWidth = 1
        super.layer.borderColor = UIColor.red.cgColor
        super.clipsToBounds = true
        super.layer.masksToBounds = true
        super.autocapitalizationType = .sentences
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
