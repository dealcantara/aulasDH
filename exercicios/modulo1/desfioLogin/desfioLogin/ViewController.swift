//
//  ViewController.swift
//  desfioLogin
//
//  Created by Elder Alcantara on 11/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class Usuario {
    
    var email: String?
    var password: String?
    
    init(email: String?, password: String?) {
        self.email = email
        self.password = password
    }
}



class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    var usuario: Usuario = Usuario(email: "Elder", password: "1234")
    
    
    
    func enableButton(value: Bool) {
        
        if value {
            
            self.loginButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
            self.cadastrarButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 1.0)
            
        } else {
            
            self.loginButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
            self.cadastrarButton.backgroundColor = UIColor(red: 35/255, green: 112/255, blue: 239/255, alpha: 0.4)
            
        }
        
        self.loginButton.isEnabled = value
        self.cadastrarButton.isEnabled = value
        
    }
    
    
    
    func clearFields() {
        
        self.loginTextField.text = nil
        self.senhaTextField.text = nil
    }
    
    
    
    func checkIsValidationFields() -> Bool {
        
        if !(self.usuario.email?.isEmpty ?? false) && !(self.usuario.password?.isEmpty ?? false) {
            self.enableButton(value: true)
            return true
        }
        self.enableButton(value: false)
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.enableButton(value: false)
        self.loginTextField.delegate = self
        self.senhaTextField.delegate = self
        self.senhaTextField.isSecureTextEntry = true
        
    }
    
    
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        print("login")
        
        if self.loginTextField.text == usuario.email && self.senhaTextField.text == usuario.password {
            self.view.backgroundColor = .green
        } else {
            self.view.backgroundColor = .red
        }
    }
    
    
    
    @IBAction func tappedCadastrarButton(_ sender: Any) {
        
        self.loginTextField.resignFirstResponder()
        self.senhaTextField.resignFirstResponder()
        print("cadastrar")
        
        if self.checkIsValidationFields() {
            self.clearFields()
        }
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.loginTextField {
            self.senhaTextField.becomeFirstResponder()
        } else {
            self.senhaTextField.resignFirstResponder()
        }
        
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.loginTextField {
            self.usuario.email = textField.text
        } else {
            self.usuario.password = textField.text
        }
        
        print(self.usuario.email)
        print(self.usuario.password)
        
        let _ = self.checkIsValidationFields()
        
    }
}
