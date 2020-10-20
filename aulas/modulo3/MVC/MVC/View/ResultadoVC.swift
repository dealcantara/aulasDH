//
//  ResultadoVC.swift
//  MVC
//
//  Created by Elder Alcantara on 06/10/20.
//

import UIKit

class ResultadoVC: UIViewController {

    @IBOutlet weak var resultadoLabel: UILabel!
    
    var controller: ListaCarrosController = ListaCarrosController()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.resultadoLabel.text = self.controller.modeloCarroSorteado

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clicouFechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
