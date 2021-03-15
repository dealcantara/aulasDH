//
//  ViewController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 25/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goTest(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "goteste", sender: self)
        
    }
    
}

