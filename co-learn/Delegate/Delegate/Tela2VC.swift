//
//  Tela2VC.swift
//  Delegate
//
//  Created by Elder Alcantara on 02/12/20.
//

import UIKit

class Tela2VC: UIViewController {
    
    var delegate: MyDelegate?
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func irParaTela1(_ sender: Any) {
        
        if self.myTextField.text != "" {
            
            self.dismiss(animated: true)
            self.delegate?.alterarLabel(texto: self.myTextField.text ?? "")
            
            
        }
        
        
        
    }
    
    
    
    
}
