//
//  ViewController.swift
//  Delegate
//
//  Created by Elder Alcantara on 02/12/20.
//

import UIKit


protocol MyDelegate {
    func alterarLabel(texto: String) 
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func irParaTela2(_ sender: Any) {
        
        performSegue(withIdentifier: "tela2", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tela2" {
            
            if let destinationViewController = segue.destination as? Tela2VC {
                destinationViewController.delegate = self
            }
            
        }
            
    }
    
}

extension ViewController: MyDelegate {

    func alterarLabel(texto: String) {
        
        self.myLabel?.text = texto
        
    }

}
