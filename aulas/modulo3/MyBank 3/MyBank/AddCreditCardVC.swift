//
//  AddCreditCardVC.swift
//  MyBank
//
//  Created by Elder Alcantara on 17/11/20.
//

import UIKit

class AddCreditCardVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var numeroCartaoTextField: UITextField!
    @IBOutlet weak var dataValidadeTextField: UITextField!
    @IBOutlet weak var bandeiraSegmentedControl: UISegmentedControl!
    @IBOutlet weak var fotoButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nomeTextField.delegate = self
        self.numeroCartaoTextField.delegate = self
        self.dataValidadeTextField.delegate = self

        let borderWidth: CGFloat = 0.5
        self.nomeTextField.layer.borderWidth = borderWidth
        self.numeroCartaoTextField.layer.borderWidth = borderWidth
        self.dataValidadeTextField.layer.borderWidth = borderWidth
        
        let red = UIColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        self.nomeTextField.layer.borderColor = red.cgColor
        self.numeroCartaoTextField.layer.borderColor = red.cgColor
        self.dataValidadeTextField.layer.borderColor = red.cgColor
        
        self.nomeTextField.layer.cornerRadius = 4
        self.numeroCartaoTextField.layer.cornerRadius = 4
        self.dataValidadeTextField.layer.cornerRadius = 4
        self.fotoButton.layer.cornerRadius = 4
        self.salvarButton.layer.cornerRadius = 4
        
        self.bandeiraSegmentedControl.actionForSegment(at: 0)
        
        self.salvarButton.isEnabled = false
        self.salvarButton.backgroundColor = UIColor(ciColor: .gray)
        
        
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.nomeTextField {
            print("Saiu do campo NOME")
            salvarButtonIsEnable()
            
        }
        
        if textField == self.numeroCartaoTextField {
            print("Saiu do campo NUMERO DO CARTAO")
            salvarButtonIsEnable()
        }
        
        if textField == self.dataValidadeTextField {
            print("Saiu do campo DATA VALIDADE")
            salvarButtonIsEnable()
        }
            
            
    }
    
    
    func salvarButtonIsEnable() {
       
        if self.nomeTextField.text == "" || self.numeroCartaoTextField.text == "" || self.dataValidadeTextField.text == "" {
            
            self.salvarButton.isEnabled = false
            self.salvarButton.backgroundColor = UIColor(ciColor: .gray)
            
        } else {
            
            self.salvarButton.isEnabled = true
            self.salvarButton.backgroundColor = UIColor(ciColor: .red)
            
        }
    }


}
