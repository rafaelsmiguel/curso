//
//  AddCartaoVC.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 17/11/20.
//

import UIKit
import Lottie

protocol AddCartaoDelegate: class {
    func addCartao(cartao: CartaoElement)
}

class AddCartaoVC: BaseViewController {

    private var dateView: UIPickerView?
    private var months: [String] = []
    private var years: [String] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberCardTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var segmentedBrand: UISegmentedControl!
    
    
    weak var delegate: AddCartaoDelegate?
    
    var viewModel: AddCartaoViewModel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AddCartaoViewModel(nome: "", numero: "", data: "")
        
        self.nameTextField.delegate = self
        self.numberCardTextField.delegate = self
        self.dateTextField.delegate = self
        
        self.configDateView()
        self.loadYears()
        self.loadMonth()
        
        segmentedBrand.addTarget(self, action: #selector(AddCartaoVC.changeAndRepeat(sender:)), for:.allEvents)
        
        self.showLoading()
    }
    
    @objc func changeAndRepeat(sender: UISegmentedControl) {
        
        var bandeira = ""
        
        if sender.selectedSegmentIndex == 0 {
            bandeira = "0"
        } else if sender.selectedSegmentIndex == 1 {
            bandeira = "1"
        } else {
            bandeira = "2"
        }
        
        viewModel?.setBandeira(bandeira: bandeira)
        
    }
    
    
    @IBAction func tapFoto(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: "Escolha uma ação", preferredStyle: .actionSheet)
        
        let cameraButton: UIAlertAction = UIAlertAction(title: "Câmera", style: .default) { (action) in
            print("selecionou câmera")
        }
        
        let galeryButton: UIAlertAction = UIAlertAction(title: "Galeria", style: .default) { (action) in
            print("selecionou galeria")
        }
        
        let cancelarButton: UIAlertAction = UIAlertAction(title: "Cancelar", style: .destructive) { (action) in
            print("cancelar")
        }
        
        alert.addAction(cameraButton)
        alert.addAction(galeryButton)
        alert.addAction(cancelarButton)
        
        self.present(alert, animated: true, completion: nil)
       
    }
    
    @IBAction func tapSave(_ sender: UIButton) {
 
        var erro = false
        var negativeAlert: UIAlertController?

        if viewModel?.nome == ""{
            negativeAlert = UIAlertController(title: "Erro", message: "O nome deve ser preenchido.", preferredStyle: .alert)
            erro = true
        } else if viewModel?.numero == ""{
            negativeAlert = UIAlertController(title: "Erro", message: "O número deve ser preenchido.", preferredStyle: .alert)
            erro = true
        } else if viewModel?.data == ""{
            negativeAlert = UIAlertController(title: "Erro", message: "A data deve ser preenchida.", preferredStyle: .alert)
            erro = true
        }
        
        let alert: UIAlertController?
        let button: UIAlertAction?
        
        if erro {
            alert = negativeAlert ?? UIAlertController()
            button = UIAlertAction(title: "Entendi", style: .default, handler: nil)
        }
        else {
            alert = UIAlertController(title: "Sucesso", message: "Cartão cadastrado com sucesso", preferredStyle: .alert)
            button = UIAlertAction(title: "ok", style: .default) { (action) in
                
                self.delegate?.addCartao(cartao: CartaoElement(id: String(Int.random(in: 1...1000)), nome: self.viewModel?.nome ?? "", data: self.viewModel?.data ?? "", numero: self.viewModel?.numero ?? "", bandeira: Flag.loadFlag(index: self.segmentedBrand.selectedSegmentIndex).rawValue))
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        alert?.addAction(button ?? UIAlertAction())
        
        self.present(alert ?? UIAlertController(), animated: true, completion: nil)
        
    }
    
    private func configToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.backgroundColor = UIColor.red
        toolBar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Pronto", style: .plain, target: self, action: #selector(doneClick))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.dateTextField.inputAccessoryView = toolBar
    }
    
    private func loadYears() {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        self.years = (currentYear...2100).map{String($0)}
    }
    
    private func loadMonth() {
        self.months = (1...12).map{String($0)}
    }
    
    private func configDateView() {
        self.dateView =  UIPickerView()
        self.dateView?.delegate = self
        self.dateView?.dataSource = self
        
        self.dateView?.backgroundColor = .red
        self.dateView?.setValue(UIColor.white, forKey: "textColor")
        self.dateTextField.inputView = self.dateView
        
        self.configToolBar()
    }
    
    @objc private func cancelClick() {
        
       
        
        self.dateTextField.resignFirstResponder()
    }
    
    @objc private func doneClick() {
        
        let monthSelected = self.dateView?.selectedRow(inComponent: 0) ?? 0
        let yearSelected = self.dateView?.selectedRow(inComponent: 1) ?? 0
        
        self.dateTextField.text = "\(self.months[monthSelected]) / \(self.years[yearSelected])"
        
        self.dateTextField.resignFirstResponder()
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showToast(message : String, showTop : Bool = false) {
        
        let widthBackground = self.view.frame.size.width-60
        let widthMessage = widthBackground-40
        let toastLabel = UILabel(frame: CGRect(x: ((widthBackground-widthMessage)/2), y: 10, width: widthMessage, height: 0))
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.lineBreakMode = .byWordWrapping
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
        toastLabel.frame = CGRect(x: ((widthBackground-toastLabel.frame.size.width)/2), y: 10, width: toastLabel.frame.size.width, height: toastLabel.frame.size.height)
        
        
        var yPosition = self.view.frame.size.height-100;
        
        if(showTop)
        {
            yPosition = 100;
        }
        
        let toastView = UIView(frame: CGRect(x: ((self.view.frame.size.width-widthBackground)/2), y: yPosition, width: widthBackground, height:toastLabel.frame.size.height+20))
        toastView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        toastView.alpha = 1.0
        toastView.layer.cornerRadius = 20;
        toastView.clipsToBounds  =  true
        
        toastView.addSubview(toastLabel)
        
        self.view.addSubview(toastView)
        
        UIView.animate(withDuration: 4.0, delay: 2.0, options: .curveEaseOut, animations: {
            toastView.alpha = 0.0
        }, completion: {(isCompleted) in
            toastView.removeFromSuperview()
        })
    }

}

extension AddCartaoVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.nameTextField {
            if textField.text == "" {
                showToast(message: "O nome deve ser preenchido.",showTop: true)
            } else {
                viewModel?.setNome(nome: textField.text ?? "")
            }
        } else if textField == self.numberCardTextField {
            if textField.text == "" {
                showToast(message: "O cartão deve ser preenchido.",showTop: true)
            } else {
                viewModel?.setNumeroCartao(numero: textField.text ?? "")
            }
        } else if textField == self.dateTextField {
            if textField.text == "" {
                showToast(message: "A data deve ser preenchida.",showTop: true)
            } else {
                viewModel?.setData(data: textField.text ?? "")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.nameTextField {
            numberCardTextField.becomeFirstResponder()
        } else if textField == self.numberCardTextField {
            dateTextField.becomeFirstResponder()
        } else if textField == self.dateTextField {
            dateTextField.resignFirstResponder()
        }
        
        return true
    }
}

extension AddCartaoVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.months.count
        } else {
            return self.years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return self.months[row]
        } else {
            return self.years[row]
        }
    }
    
    
    
}
