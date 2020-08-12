//
//  ViewController.swift
//  Desafio Login
//
//  Created by Rafael Miguel on 11/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var loginView: LoginView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.setupView()
    }

    
}

