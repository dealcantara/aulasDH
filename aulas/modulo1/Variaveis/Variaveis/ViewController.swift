//
//  ViewController.swift
//  Variaveis
//
//  Created by Elder Alcantara on 13/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    var isBlue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addButton.layer.cornerRadius = 6
        self.addButton.layer.borderColor = UIColor.orange.cgColor
        self.addButton.layer.borderWidth = 2
        
        self.changeColor(color: .orange, isblue: false)
        
        let name: String = "Elder"
        let lastname: String = "Alcantara"
        var job: String = "Developer"
        var age: Int = 36
        var adress: String = "Rua eneas, 769"
        var weight: Float = 83
        var height: Double = 79
        var perfil: String = "Nome: \(name) \(lastname), Trabalho: \(job), Idade: \(age) anos, Endereço: \(adress), Peso: \(weight) kg e altura \(height)"
        
        print(perfil)
        
        self.nameLabel.text = perfil
        
    }
    
    @IBAction func tabAddButton(_ sender: UIButton) {
        
//        if let, guard let and if ternary
        
        guard let weightValue = Float(self.weightTextField.text!) else { return print("weightValue empty!") }
        guard let heightValue = Float(self.heightTextField.text!) else { return print("heightValue empty") }
        
        
        
        self.nameLabel.text = self.calcIMC(weight: weightValue, height: heightValue)
        
        self.changeColor(color: self.statusColor(result: self.nameLabel.text ?? ""), isblue: self.isBlue)
        
//        if self.isBlue == true {
//            changeColor(color: .orange, isblue: false)
//        } else {
//            changeColor(color: .blue, isblue: true)
//        }
    }
    
    func changeColor(color: UIColor, isblue: Bool) {
        
        self.nameLabel.layer.cornerRadius = 8
        self.nameLabel.layer.borderWidth = 2
        self.nameLabel.layer.borderColor = color.cgColor
        self.isBlue = isblue
        
        if isblue {
            print(self.calcNumbers())
        } else {
            print(self.fullName(name:
                "Elder", lastName: "Alcantara"))
        }
        
    }
    
    func calcNumbers() -> Float {
        let preco1: Int = 10
        let preco2: Int = 20
        
        return Float(preco1 + preco2) //Casting
    }
    
    func fullName(name: String, lastName: String) -> String {
        return "\(name) \(lastName)"
    }
    
    func statusColor(result: String) -> UIColor {
        switch result {
        case "Abaixo do Peso":
            return .darkGray
        case "Peso Normal":
            return .green
        case "Sobrepeso":
            return .yellow
        case "Obesidade Tipo 1":
            return .orange
        default:
            return .red
        }
    }
    
    func calcIMC(weight: Float, height: Float) -> String {
        
        let squaredHeight = height * height
        let imc = weight / squaredHeight
        
        if imc < 19 {
            return "Abaixo do Peso"
        } else if imc >= 19 && imc < 25 {
            return "Peso Normal"
        } else if imc >= 25 && imc < 30 {
            return "Sobrepeso"
        } else if imc >= 30 && imc < 40 {
            return "Obesidade Tipo 1"
        } else if imc >= 40 {
            return "Obesidade Tipo 2"
        }
        
        return "Não conseguimos calcular!"
        
    }
}

