//
//  ViewController.swift
//  datePicker
//
//  Created by Elder Alcantara on 10/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.phoneTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedMyDatePiker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        
        let strDate: String = dateFormatter.string(from: self.datePicker.date)
        
        self.ageLabel.text = strDate
        self.nomeLabel.text = self.nameTextField.text
        self.phoneLabel.text = self.phoneTextField.text
        
        
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
}
