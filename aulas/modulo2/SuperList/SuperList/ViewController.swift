//
//  ViewController.swift
//  SuperList
//
//  Created by Elder Alcantara on 20/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var produtoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicouAddButton(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "addViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc: AddViewController? = segue.destination as? AddViewController
        
        vc?.delegate = self
        
    }
    
}


extension ViewController: AddViewControllerProtocol {
    
    func successAssProduto(array: [Produto]) {
        
        var value: String = self.produtoLabel.text ?? ""
        
        value = "\(value), \(array.last?.produto ?? "")"
        
        self.produtoLabel.text = value
        print("= = = successAssProduto = = =")
        print(array)
    }
}
