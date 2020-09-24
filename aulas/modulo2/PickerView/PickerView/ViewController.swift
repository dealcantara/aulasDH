//
//  ViewController.swift
//  PickerView
//
//  Created by Elder Alcantara on 22/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var arrayPickerView = ["Felipe", "Caio", "João", "Luan"]
    var arraySobrenomes = ["Silva", "Pereira", "Souza", "Alcantara"]
    
    var nome: String = ""
    var sobrenome: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var preencher: UIPickerView!
    
    
    
}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       
        
        if component == 0 {
            
            return self.arrayPickerView.count
            
        } else {
            
            return self.arraySobrenomes.count
            
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.arrayPickerView[row]
            
        } else {
            
            return self.arraySobrenomes[row]
            
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        if component == 0 {
            
            nome = self.arrayPickerView[row]
            
        } else {

            sobrenome = self.arraySobrenomes[row]
            
        }
        
        self.resultadoLabel.text = nome + " " + sobrenome
        
    }
    
}
