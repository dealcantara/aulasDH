//
//  CalculadoraView.swift
//  CalculadoraIMC
//
//  Created by Felipe Miranda on 31/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit
import Foundation

protocol CalculadoraViewProtocol: class {
    
    func successCalcIMC(value: String)
    
    func failedCalcIMC(value: String)
    
}

class CalculadoraView: UIView {
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    
    weak var delegate: CalculadoraViewProtocol?
    
    func setupView(color: UIColor) {
        self.alturaTextField.placeholder = "Altura"
        self.pesoTextField.placeholder = "Peso"
        self.backgroundColor = color
        
    }
    
    
    func calcularIMC() {
        
        //
        //        guard let alturaText = self.alturaTextField.text else{return ""}
        //
        //        let alturaFloat: Float? = Float(alturaText)
        
        //        guard let alturaFloat = self.alturaTextField?.text, let altura = Float(alturaFloat) else{return ""}
        
        let height: Float = Float(self.alturaTextField.text ?? "" ) ?? 0
        let weight: Float = Float(self.pesoTextField.text ?? "" ) ?? 0
        
        
        let height2 = height * height
        
        let imc = weight/height2
        
        var result: String = "Não conseguimos calcular"
        
        if height <= 0 || weight <= 0 {
            
            self.delegate?.failedCalcIMC(value: result)
            
        } else {
            
            if imc < 16 {
                result = "Abaixo do peso"
                self.delegate?.successCalcIMC(value: result)
            } else if imc >= 19 && imc < 25 {
                result = "Peso normal"
                self.delegate?.successCalcIMC(value: result)
            } else if imc >= 25 && imc < 30 {
                result = "Sobrepeso"
                self.delegate?.successCalcIMC(value: result)
            } else if imc >= 30 && imc < 40 {
                result = "Obesidade Grau 1"
                self.delegate?.successCalcIMC(value: result)
            } else if imc > 40 {
                result = "Obesidade Grau 2"
                self.delegate?.successCalcIMC(value: result)
            }
        }
        
    }
    
}
