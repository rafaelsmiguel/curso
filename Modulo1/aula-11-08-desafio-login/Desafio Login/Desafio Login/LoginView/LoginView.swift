//
//  LoginView.swift
//  Desafio Login
//
//  Created by Rafael Miguel on 11/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewPrincipal: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    var userArray: [UserModel]? = nil
    var user: UserModel? = nil
    
    func setupView(){
        
        self.txtEmail.placeholder = "Digite seu e-mail"
        self.txtEmail.delegate = self
        
        self.txtPassword.placeholder = "Digite sua senha"
        self.txtPassword.delegate = self
        
        user = UserModel(email: txtEmail.text, password: txtPassword.text)
        enableButton(value: false)
        
    }
    
    func enableButton(value:Bool) {
        if !value {
            self.btnLogin.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
            self.btnAdd.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
        } else {
            self.btnLogin.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
            self.btnAdd.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
        }
        
        self.btnLogin.isEnabled = value
        self.btnAdd.isEnabled = value
    }
    
    func clearFields() {
        self.txtEmail.text = ""
        self.txtPassword.text = ""
    }
    
    
    @IBAction func didTappedAdd(_ sender: Any) {
        let user = UserModel(email: txtEmail.text, password: txtPassword.text)
        
        if userArray == nil {
            userArray = [UserModel]()
        }
        
        userArray?.append(user)
        
        if self.checkIsValidFields() {
            self.clearFields()
        }
        
    }
    
    @IBAction func didTappedLogin(_ sender: Any) {
        
        if self.txtEmail.text == user?.email && self.txtPassword.text == user?.password {
            //pintar a view de verde
        } else {
            //pintar a view de vermelho
        }
        
        if let users = userArray {
            if !users.isEmpty {
                for userItem in users {
                    if userItem.email == txtPassword.text && userItem.password == txtPassword.text {
                        //pintar cor de fundo de verde
                        break
                    }
                }
            }
        }
    }
    
    func checkIsValidFields() -> Bool {
        if !(self.user?.email?.isEmpty ?? true)  && !(self.user?.password?.isEmpty ?? true) {
            self.enableButton(value: true)
            return true
        }
        self.enableButton(value: false)
        return false
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField  == self.txtEmail {
            self.txtPassword.becomeFirstResponder()
        } else {
            self.txtPassword.resignFirstResponder()
        }
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if textField == self.txtEmail {
            self.user?.email = textField.text
        } else {
            self.user?.password = textField.text
        }
        
        let _ = self.checkIsValidFields()
    }
    
}
