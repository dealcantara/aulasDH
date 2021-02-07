//
//  ViewController.swift
//  DelegateComElder2
//
//  Created by Elder Alcantara on 17/11/20.
//

import UIKit

protocol MyDelegate {
    
    func alterarLabel()
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionButton(_ sender: Any) {
        
        performSegue(withIdentifier: "Tela2", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "Tela2"{
            
            if let destinationViewControler = segue.destination as? Tela2VC {
                
                destinationViewControler.textDelegate = self
                
            }
            
        }
    }
    
}

extension ViewController: MyDelegate {
    
    func alterarLabel() {
        
        self.myLabel.text = "Texto alterado!"
        
    }
    
}
