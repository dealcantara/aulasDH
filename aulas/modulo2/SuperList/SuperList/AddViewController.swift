//
//  AddViewController.swift
//  SuperList
//
//  Created by Elder Alcantara on 20/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


struct Produto {
    
    var produto: String
    var preco: String
    
}

protocol AddViewControllerProtocol: class {
    
    func successAssProduto(array: [Produto])
    
}



class AddViewController: UIViewController {
    
    @IBOutlet weak var produtoTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    weak var delegate: AddViewControllerProtocol?
    
    private var listaProdutos: [Produto] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cadastrarButton.isEnabled = true
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cadatrarButton(_ sender: Any) {
                
        let _produto: String = self.produtoTextField.text ?? ""
        let _preco: String = self.precoTextField.text ?? ""
        
        
        if _produto != "" && _preco != "" {
            
            self.listaProdutos.append(Produto(produto: _produto, preco: _preco))
            
            print(listaProdutos)
            
            self.produtoTextField.text = nil
            self.precoTextField.text = nil
            
            self.delegate?.successAssProduto(array: self.listaProdutos)
            
        }
        
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
