//
//  ViewController.swift
//  sorteio
//
//  Created by Rafael Miguel on 13/08/20.
//  Copyright © 2020 Rafael Miguel. All rights reserved.
//

import UIKit

struct Student {
    var name: String
    var id: Int
}

class ViewController: UIViewController {
    
//MARK: IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var btnSort: UIButton!
    
    //MARK: Grupo 1
    @IBOutlet weak var lblNome1G1: UILabel!
    @IBOutlet weak var lblNome2G1: UILabel!
    @IBOutlet weak var lblNome3G1: UILabel!
    @IBOutlet weak var lblNome4G1: UILabel!
    @IBOutlet weak var lblNome5G1: UILabel!
    
    //MARK: Grupo 2
    @IBOutlet weak var lblNome1G2: UILabel!
    @IBOutlet weak var lblNome2G2: UILabel!
    @IBOutlet weak var lblNome3G2: UILabel!
    @IBOutlet weak var lblNome4G2: UILabel!
    @IBOutlet weak var lblNome5G2: UILabel!
    
    
    //MARK: Grupo 3
    @IBOutlet weak var lblNome1G3: UILabel!
    @IBOutlet weak var lblNome2G3: UILabel!
    @IBOutlet weak var lblNome3G3: UILabel!
    @IBOutlet weak var lblNome4G3: UILabel!
    
    
//MARK: Arrays
    var arrayName:[Student] = [Student]()
    var arrayG1:[Student] = []
    var arrayG2:[Student] = []
    var arrayG3:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    @IBAction func tappedSort(_ sender: Any) {
        
//        var temp = arc4random() % 14
        
        for _ in self.arrayName {
            let student = self.arrayName.randomElement()
            
            if let student = student {
                
                print(student.name)
                
                if self.arrayG1.count < 5 {
                    arrayG1.append(student)
                } else if self.arrayG2.count < 5 {
                    
                    arrayG2.append(student)
                } else {
                    self.arrayG3 = self.arrayName
                    break
                }
                
                self.arrayName = self.arrayName.filter({$0.id != student.id})
            }
        }
        
        self.lblNome1G1.text = self.arrayG1[0].name
        self.lblNome2G1.text = self.arrayG1[1].name
        self.lblNome3G1.text = self.arrayG1[2].name
        self.lblNome4G1.text = self.arrayG1[3].name
        self.lblNome5G1.text = self.arrayG1[4].name
        
        self.lblNome1G2.text = self.arrayG2[0].name
        self.lblNome2G2.text = self.arrayG2[1].name
        self.lblNome3G2.text = self.arrayG2[2].name
        self.lblNome4G2.text = self.arrayG2[3].name
        self.lblNome5G2.text = self.arrayG2[4].name
        
        self.lblNome1G3.text = self.arrayG3[0].name
        self.lblNome2G3.text = self.arrayG3[1].name
        self.lblNome3G3.text = self.arrayG3[2].name
        self.lblNome4G3.text = self.arrayG3[3].name
       
        
        //self.arrayName = self.arrayName.
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.arrayName.count < 14 {
            
            let student = Student(name: textField.text ?? "", id: self.arrayName.count)
                    
            self.arrayName.append(student)
            self.nameTextField.text = ""
        }
        
         print(self.arrayName)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.arrayName.count < 14 {
            let student = Student(name: textField.text ?? "", id: self.arrayName.count)
                    
            self.arrayName.append(student)
        }
        
        print(self.arrayName)
    }
    

}

