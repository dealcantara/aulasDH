//
//  AddViewController.swift
//  SuperList
//
//  Created by Elder Alcantara on 20/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


protocol AddViewControllerProtocol: class {
    
    func successAssProduto(array: [Produto])
    
}


class AddViewController: UIViewController {
    
    @IBOutlet weak var produtoTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var categoriaSegmentedControl: UISegmentedControl!
    
    weak var delegate: AddViewControllerProtocol?
    
    private var listaProdutos: [Produto] = []
    private var categoriaSelected: Categoria = .alimento
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cadastrarButton.isEnabled = true
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedCadastrarButton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.categoriaSelected = .alimento
        }else {
            self.categoriaSelected = .limpeza
        }
        print(sender.selectedSegmentIndex)
    }
    

    
    @IBAction func cadatrarButton(_ sender: Any) {
                
        let _produto: String = self.produtoTextField.text ?? ""
        let _preco: String = self.precoTextField.text ?? ""
        
        
        if _produto != "" && _preco != "" {
            
            self.listaProdutos.append(Produto(nome: _produto, preco: _preco, categoria: self.categoriaSelected))
            
//            print(listaProdutos)
            
            self.produtoTextField.text = nil
            self.precoTextField.text = nil
            self.categoriaSegmentedControl.selectedSegmentIndex = 0
            
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
