//
//  Tela2VC.swift
//  DelegateComElder2
//
//  Created by Elder Alcantara on 17/11/20.
//

import UIKit


class Tela2VC: UIViewController {
    
    var textDelegate: MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func voltarAlterarLabel(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
            self.textDelegate?.alterarLabel()
            
        }
        
    }
    
}
