//
//  ViewController.swift
//  ChallengePickerView
//
//  Created by Elder Alcantara on 22/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valorTextField: UITextField!
    @IBOutlet weak var adicionarButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var arrayPickerView: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    
    @IBAction func addValue(_ sender: Any) {
        
        var existingValue: Bool = false
        
        for i in self.arrayPickerView {
            if i == self.valorTextField.text {
                existingValue = true
            }
        }
        
        if self.valorTextField.text != "" && existingValue == false {
            
            arrayPickerView.append(self.valorTextField.text ?? "")
            self.pickerView.reloadAllComponents()
            self.valorTextField.text = nil
            
        }
        
        
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        self.arrayPickerView.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.arrayPickerView[row]
        
        
        
    }
    
    
    
}
