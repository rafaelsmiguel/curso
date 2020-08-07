//
//  BaseViewController.swift
//  CalculadoraIMC
//
//  Created by Rafael Miguel on 03/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .red
    }
    
    
}
